#!/bin/bash

# Linux+ Skills Assessment Grading Script
# Total Points: 165
# Usage: ./grade_lab.sh [student_name]

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Initialize scoring variables
total_score=0
max_score=165

# Student information
STUDENT_NAME=${1:-"Unknown Student"}
ROCKY1_IP="10.0.0.2"
ROCKY2_IP="10.0.0.3"
GATEWAY="10.0.0.1"

# Log file for grading results
LOG_FILE="grading_results_$(date +%Y%m%d_%H%M%S).txt"

echo "=======================================" | tee -a "$LOG_FILE"
echo "Linux+ Skills Assessment Grading" | tee -a "$LOG_FILE"
echo "Student: $STUDENT_NAME" | tee -a "$LOG_FILE"
echo "Date: $(date)" | tee -a "$LOG_FILE"
echo "=======================================" | tee -a "$LOG_FILE"

# Function to print section headers
print_section() {
    echo -e "\n${BLUE}=== $1 ===${NC}" | tee -a "$LOG_FILE"
}

# Function to award points
award_points() {
    local points=$1
    local max_points=$2
    local description=$3
    
    total_score=$((total_score + points))
    
    if [ $points -eq $max_points ]; then
        echo -e "${GREEN}✓ $description: $points/$max_points points${NC}" | tee -a "$LOG_FILE"
    elif [ $points -gt 0 ]; then
        echo -e "${YELLOW}⚠ $description: $points/$max_points points${NC}" | tee -a "$LOG_FILE"
    else
        echo -e "${RED}✗ $description: $points/$max_points points${NC}" | tee -a "$LOG_FILE"
    fi
}

# Function to check if command exists
check_command() {
    if command -v "$1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

# 1. Network Configuration and Hostname Setup (20 points)
print_section "1. Network Configuration and Hostname Setup (20 points)"

# Check Rocky 1 configuration
points=0
if hostname | grep -q "r1.example.com"; then
    points=$((points + 3))
fi

if ip addr show | grep -q "$ROCKY1_IP/24"; then
    points=$((points + 3))
fi

if grep -q "r1.example.com" /etc/hosts; then
    points=$((points + 2))
fi

if ping -c 1 "$GATEWAY" &>/dev/null; then
    points=$((points + 2))
fi

award_points $points 10 "Question 1.1 - Rocky 1 Network Configuration"

# Note: Rocky 2 would need to be checked separately when script runs on Rocky 2
echo -e "${YELLOW}Note: Rocky 2 configuration must be verified manually on Rocky 2${NC}" | tee -a "$LOG_FILE"
award_points 0 10 "Question 1.2 - Rocky 2 Network Configuration (Manual Check Required)"

# 2. Directory and File Management (20 points)
print_section "2. Directory and File Management (20 points)"

points=0
if [ -d "/opt/company/departments/hr" ] && [ -d "/opt/company/departments/it" ] && [ -d "/opt/company/departments/finance" ]; then
    points=$((points + 2))
fi

if [ -d "/opt/company/projects/project1" ] && [ -d "/opt/company/projects/project2" ]; then
    points=$((points + 2))
fi

if [ -d "/opt/company/shared/documents" ]; then
    points=$((points + 1))
fi

if [ -f "/opt/company/departments/hr/readme.txt" ] && [ -f "/opt/company/departments/it/readme.txt" ] && [ -f "/opt/company/departments/finance/readme.txt" ]; then
    points=$((points + 3))
fi

if [ -f "/opt/company/shared/documents/company_policy.txt" ] && [ -s "/opt/company/shared/documents/company_policy.txt" ]; then
    points=$((points + 2))
fi

award_points $points 10 "Question 2.1 - Rocky 1 Directory Structure"

# Check for Rocky 2 file operations (manual check)
echo -e "${YELLOW}Note: Rocky 2 file operations must be verified manually on Rocky 2${NC}" | tee -a "$LOG_FILE"
award_points 0 10 "Question 2.2 - Rocky 2 File Operations (Manual Check Required)"

# 3. File Permissions and Ownership (25 points)
print_section "3. File Permissions and Ownership (25 points)"

points=0
if getent group hr_group &>/dev/null && getent group it_group &>/dev/null && getent group finance_group &>/dev/null && getent group managers &>/dev/null; then
    points=$((points + 3))
fi

if [ -d "/opt/company/departments/hr" ]; then
    owner=$(stat -c "%U:%G" /opt/company/departments/hr 2>/dev/null)
    if [[ "$owner" == "root:hr_group" ]]; then
        points=$((points + 3))
    fi
fi

if [ -d "/opt/company/departments/it" ]; then
    owner=$(stat -c "%U:%G" /opt/company/departments/it 2>/dev/null)
    if [[ "$owner" == "root:it_group" ]]; then
        points=$((points + 3))
    fi
fi

if [ -d "/opt/company/departments/finance" ]; then
    owner=$(stat -c "%U:%G" /opt/company/departments/finance 2>/dev/null)
    if [[ "$owner" == "root:finance_group" ]]; then
        points=$((points + 3))
    fi
fi

# Check permissions (should be 770 for department folders)
if [ -d "/opt/company/departments/hr" ]; then
    perms=$(stat -c "%a" /opt/company/departments/hr 2>/dev/null)
    if [[ "$perms" == "770" ]]; then
        points=$((points + 2))
    fi
fi

if [ -d "/opt/company/shared" ]; then
    perms=$(stat -c "%a" /opt/company/shared 2>/dev/null)
    # Should be 775 or similar (everyone rx, managers w)
    if [[ "$perms" =~ ^[0-9]*75$ ]]; then
        points=$((points + 1))
    fi
fi

award_points $points 15 "Question 3.1 - Rocky 1 Permissions and Ownership"

# Check special permissions on Rocky 2
echo -e "${YELLOW}Note: Rocky 2 special permissions must be verified manually on Rocky 2${NC}" | tee -a "$LOG_FILE"
award_points 0 10 "Question 3.2 - Rocky 2 Special Permissions (Manual Check Required)"

# 4. Traditional Partitioning (20 points)
print_section "4. Traditional Partitioning (20 points)"

points=0
if fdisk -l /dev/sdb 2>/dev/null | grep -q "Disklabel type.*dos"; then
    points=$((points + 2))
fi

if lsblk /dev/sdb 2>/dev/null | grep -q "sdb1"; then
    points=$((points + 5))
fi

if lsblk -f /dev/sdb1 2>/dev/null | grep -q "ext4"; then
    points=$((points + 3))
fi

if mount | grep -q "/dev/sdb1.*ext4.*/data"; then
    points=$((points + 3))
fi

if grep -q "/dev/sdb1.*ext4.*/data" /etc/fstab; then
    points=$((points + 4))
fi

if df -h | grep -q "/data"; then
    points=$((points + 3))
fi

award_points $points 20 "Question 4.1 - Traditional Partitioning"

# 5. LVM Partitioning (35 points)
print_section "5. LVM Partitioning (35 points)"

points=0
if pvs 2>/dev/null | grep -q "/dev/sdc" && pvs 2>/dev/null | grep -q "/dev/sdd"; then
    points=$((points + 4))
fi

if vgs 2>/dev/null | grep -q "company_vg"; then
    points=$((points + 4))
fi

if lvs 2>/dev/null | grep -q "lv_data.*company_vg"; then
    points=$((points + 4))
fi

if lsblk -f 2>/dev/null | grep -q "lv_data.*xfs"; then
    points=$((points + 4))
fi

if mount | grep -q "company_vg-lv_data.*/company_data" && grep -q "company_data" /etc/fstab; then
    points=$((points + 4))
fi

award_points $points 20 "Question 5.1 - LVM Setup"

# Check LVM management operations
lvm_mgmt_points=0
if lvdisplay company_vg &>/dev/null && pvdisplay &>/dev/null && vgdisplay company_vg &>/dev/null; then
    lvm_mgmt_points=$((lvm_mgmt_points + 3))
fi

# Check if snapshot exists or was created (evidence in logs or current state)
if lvs 2>/dev/null | grep -q "lv_data_snap"; then
    lvm_mgmt_points=$((lvm_mgmt_points + 6))
    echo -e "${YELLOW}Warning: Snapshot still exists - should be removed after testing${NC}" | tee -a "$LOG_FILE"
elif [ -f "/var/log/lvm_snapshot_test.log" ]; then
    # Alternative: check for evidence of snapshot creation/removal
    lvm_mgmt_points=$((lvm_mgmt_points + 6))
    lvm_mgmt_points=$((lvm_mgmt_points + 3))
    lvm_mgmt_points=$((lvm_mgmt_points + 3))
fi

award_points $lvm_mgmt_points 15 "Question 5.2 - LVM Management Operations"

# 6. User and Group Management (20 points)
print_section "6. User and Group Management (20 points)"

points=0
if getent group developers &>/dev/null && getent group sysadmins &>/dev/null && getent group managers &>/dev/null && getent group interns &>/dev/null; then
    points=$((points + 2))
fi

# Check custom skeleton directory
if [ -d "/etc/skel-developers" ]; then
    points=$((points + 3))
fi

if [ -d "/etc/skel-developers/source_code" ]; then
    points=$((points + 2))
fi

# Check users
users=("john_doe" "jane_smith" "bob_intern" "alice_admin")
for user in "${users[@]}"; do
    if getent passwd "$user" &>/dev/null; then
        points=$((points + 2))
        
        # Additional check for john_doe using custom skeleton
        if [ "$user" == "john_doe" ] && [ -d "/home/john_doe/source_code" ]; then
            points=$((points + 1))
        fi
    fi
done

# Check password policies
if grep -q "PASS_MIN_LEN.*8" /etc/login.defs || grep -q "minlen.*8" /etc/security/pwquality.conf; then
    points=$((points + 1))
fi

if grep -q "PASS_MAX_DAYS.*60" /etc/login.defs; then
    points=$((points + 1))
fi

# Check password aging for users
aging_set=0
for user in "${users[@]}"; do
    if chage -l "$user" 2>/dev/null | grep -q "Maximum number of days.*60"; then
        aging_set=$((aging_set + 1))
    fi
done
if [ $aging_set -ge 2 ]; then
    points=$((points + 1))
fi

award_points $points 20 "Question 6.1 - User and Group Management"

# 7. SSH Key Setup and Management (25 points)
print_section "7. SSH Key Setup and Management (25 points)"

points=0
if [ -f "/home/john_doe/.ssh/id_rsa" ] || [ -f "/home/john_doe/.ssh/id_ed25519" ] || [ -f "/home/john_doe/.ssh/id_ecdsa" ]; then
    points=$((points + 3))
fi

if [ -f "/home/john_doe/.ssh/id_rsa.pub" ] || [ -f "/home/john_doe/.ssh/id_ed25519.pub" ] || [ -f "/home/john_doe/.ssh/id_ecdsa.pub" ]; then
    points=$((points + 3))
fi

# Check SSH configuration
if grep -q "PasswordAuthentication no" /etc/ssh/sshd_config; then
    points=$((points + 3))
fi

# Test SSH service
if systemctl is-active sshd &>/dev/null || systemctl is-active ssh &>/dev/null; then
    points=$((points + 3))
fi

# Check for SSH agent evidence
if pgrep ssh-agent &>/dev/null || [ -n "$SSH_AUTH_SOCK" ]; then
    points=$((points + 3))
fi

award_points $points 15 "Question 7.1 - SSH Key Setup"

# Advanced SSH configuration (Rocky 2)
echo -e "${YELLOW}Note: Rocky 2 advanced SSH configuration must be verified manually on Rocky 2${NC}" | tee -a "$LOG_FILE"
award_points 0 10 "Question 7.2 - Advanced SSH Configuration (Manual Check Required)"

# Final scoring
print_section "Final Results"
percentage=$((total_score * 100 / max_score))

echo "" | tee -a "$LOG_FILE"
echo "=======================================" | tee -a "$LOG_FILE"
echo "FINAL GRADE SUMMARY" | tee -a "$LOG_FILE"
echo "=======================================" | tee -a "$LOG_FILE"
echo "Student: $STUDENT_NAME" | tee -a "$LOG_FILE"
echo "Total Score: $total_score / $max_score" | tee -a "$LOG_FILE"
echo "Percentage: $percentage%" | tee -a "$LOG_FILE"

if [ $percentage -ge 90 ]; then
    grade="A"
    color=$GREEN
    points_range="149-165 points"
elif [ $percentage -ge 80 ]; then
    grade="B"
    color=$BLUE
    points_range="132-148 points"
elif [ $percentage -ge 70 ]; then
    grade="C"
    color=$YELLOW
    points_range="116-131 points"
elif [ $percentage -ge 60 ]; then
    grade="D"
    color=$YELLOW
    points_range="99-115 points"
else
    grade="F"
    color=$RED
    points_range="Below 99 points"
fi

echo -e "${color}Letter Grade: $grade ($points_range)${NC}" | tee -a "$LOG_FILE"
echo "=======================================" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "MANUAL VERIFICATION REQUIRED:" | tee -a "$LOG_FILE"
echo "- Rocky 2 network configuration (Question 1.2: 10 points)" | tee -a "$LOG_FILE"
echo "- Rocky 2 file operations (Question 2.2: 10 points)" | tee -a "$LOG_FILE"
echo "- Rocky 2 special permissions (Question 3.2: 10 points)" | tee -a "$LOG_FILE"
echo "- Rocky 2 advanced SSH configuration (Question 7.2: 10 points)" | tee -a "$LOG_FILE"
echo "- LVM snapshot demonstration (if snapshot was removed)" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"
echo "Grading log saved to: $LOG_FILE" | tee -a "$LOG_FILE"

# Summary of automated checks
echo "" | tee -a "$LOG_FILE"
echo "AUTOMATED CHECKS COMPLETED:" | tee -a "$LOG_FILE"
echo "✓ Network configuration (Rocky 1)" | tee -a "$LOG_FILE"
echo "✓ Directory structure and files" | tee -a "$LOG_FILE"
echo "✓ File permissions and ownership" | tee -a "$LOG_FILE"
echo "✓ Traditional partitioning" | tee -a "$LOG_FILE"
echo "✓ LVM setup and configuration" | tee -a "$LOG_FILE"
echo "✓ User and group creation" | tee -a "$LOG_FILE"
echo "✓ SSH key generation and setup" | tee -a "$LOG_FILE"
echo "" | tee -a "$LOG_FILE"

exit 0
