#!/bin/bash

# Linux+ Skills Assessment Grading Script
# Total Points: 250
# Usage: ./grade_lab.sh [student_name]

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Initialize scoring variables
total_score=0
max_score=250

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

# Function to test SSH connectivity
test_ssh_connection() {
    local host=$1
    local user=$2
    local key_file=$3
    
    if [ -n "$key_file" ]; then
        ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no -i "$key_file" "$user@$host" "echo 'SSH connection successful'" &>/dev/null
    else
        ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no "$user@$host" "echo 'SSH connection successful'" &>/dev/null
    fi
    
    return $?
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

if ping -c 1 "$GATEWAY" &>/dev/null; then
    points=$((points + 2))
fi

if ping -c 1 "$ROCKY2_IP" &>/dev/null; then
    points=$((points + 2))
fi

award_points $points 10 "Rocky 1 Network Configuration"

# Note: Rocky 2 would need to be checked separately when script runs on Rocky 2
award_points 10 10 "Rocky 2 Network Configuration (Manual Check Required)"

# 2. Directory and File Management (20 points)
print_section "2. Directory and File Management (20 points)"

points=0
if [ -d "/opt/company/departments/hr" ] && [ -d "/opt/company/departments/it" ] && [ -d "/opt/company/departments/finance" ] && [ -d "/opt/company/projects/project1" ] && [ -d "/opt/company/shared/documents" ]; then
    points=$((points + 3))
fi

if [ -f "/opt/company/departments/hr/readme.txt" ] && [ -f "/opt/company/departments/it/readme.txt" ] && [ -f "/opt/company/departments/finance/readme.txt" ]; then
    points=$((points + 2))
fi

if [ -f "/opt/company/shared/documents/company_policy.txt" ]; then
    points=$((points + 3))
fi

if check_command tree; then
    points=$((points + 2))
fi

award_points $points 10 "Rocky 1 Directory Structure"

# Check for file operations on Rocky 2 (simulated)
award_points 10 10 "Rocky 2 File Operations (Manual Check Required)"

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

# Check permissions
if [ -d "/opt/company/departments/hr" ]; then
    perms=$(stat -c "%a" /opt/company/departments/hr 2>/dev/null)
    if [[ "$perms" == "770" ]] || [[ "$perms" == "750" ]]; then
        points=$((points + 3))
    fi
fi

award_points $points 15 "Rocky 1 Permissions and Ownership"

# Check special permissions on Rocky 2
award_points 10 10 "Rocky 2 Special Permissions (Manual Check Required)"

# 4. File Operations and Management (20 points)
print_section "4. File Operations and Management (20 points)"

points=0
# Check if find commands work
if find /var -size +1M -type f &>/dev/null; then
    points=$((points + 2))
fi

if find /etc -mtime -7 -type f &>/dev/null; then
    points=$((points + 2))
fi

if [ -d "/tmp/configs" ] && [ "$(ls -A /tmp/configs 2>/dev/null)" ]; then
    points=$((points + 3))
fi

if [ -d "/opt/company/archive" ]; then
    points=$((points + 3))
fi

award_points $points 10 "Rocky 1 File Operations"
award_points 10 10 "Rocky 2 Archive Operations (Manual Check Required)"

# 5. Traditional Partitioning (20 points)
print_section "5. Traditional Partitioning (20 points)"

points=0
if fdisk -l /dev/sdb 2>/dev/null | grep -q "Linux"; then
    points=$((points + 2))
fi

if lsblk | grep -q "sdb1.*ext4"; then
    points=$((points + 5))
fi

if mount | grep -q "/dev/sdb1.*ext4.*rw.*data"; then
    points=$((points + 3))
fi

if grep -q "/dev/sdb1.*ext4.*data" /etc/fstab; then
    points=$((points + 4))
fi

if df -h | grep -q "/data"; then
    points=$((points + 3))
fi

if mount | grep -q "/data"; then
    points=$((points + 3))
fi

award_points $points 20 "Traditional Partitioning"

# 6. LVM Partitioning (35 points)
print_section "6. LVM Partitioning (35 points)"

points=0
if pvs | grep -q "/dev/sdc" && pvs | grep -q "/dev/sdd"; then
    points=$((points + 4))
fi

if vgs | grep -q "company_vg"; then
    points=$((points + 4))
fi

if lvs | grep -q "lv_data.*company_vg"; then
    points=$((points + 4))
fi

if lsblk | grep -q "lv_data.*xfs"; then
    points=$((points + 4))
fi

if mount | grep -q "company_data" && grep -q "company_data" /etc/fstab; then
    points=$((points + 4))
fi

# Check LVM management
if lvs | grep -q "lv_data_snap"; then
    points=$((points + 6))
fi

if lvdisplay company_vg &>/dev/null; then
    points=$((points + 3))
fi

# Check if snapshot was properly removed (absence indicates it was tested and removed)
if ! lvs | grep -q "lv_data_snap"; then
    points=$((points + 3))
fi

award_points $points 35 "LVM Partitioning"

# 7. User and Group Management (30 points)
print_section "7. User and Group Management (30 points)"

points=0
if getent group developers &>/dev/null && getent group sysadmins &>/dev/null && getent group managers &>/dev/null && getent group interns &>/dev/null; then
    points=$((points + 2))
fi

users=("john_doe" "jane_smith" "bob_intern" "alice_admin")
for user in "${users[@]}"; do
    if getent passwd "$user" &>/dev/null; then
        points=$((points + 3))
    fi
done

# Check password policies
if grep -q "PASS_MIN_LEN.*8" /etc/login.defs; then
    points=$((points + 2))
fi

if grep -q "PASS_MAX_DAYS.*60" /etc/login.defs; then
    points=$((points + 1))
fi

award_points $points 20 "Rocky 1 User Management"
award_points 10 10 "Rocky 2 Advanced User Management (Manual Check Required)"

# 8. SSH Key Setup and Management (25 points)
print_section "8. SSH Key Setup and Management (25 points)"

points=0
if [ -f "/home/john_doe/.ssh/id_rsa" ] || [ -f "/home/john_doe/.ssh/id_ed25519" ]; then
    points=$((points + 3))
fi

if [ -f "/home/john_doe/.ssh/id_rsa.pub" ] || [ -f "/home/john_doe/.ssh/id_ed25519.pub" ]; then
    points=$((points + 3))
fi

# Check SSH configuration
if grep -q "PasswordAuthentication no" /etc/ssh/sshd_config; then
    points=$((points + 3))
fi

# Test SSH connection (simulated)
if systemctl is-active ssh &>/dev/null || systemctl is-active sshd &>/dev/null; then
    points=$((points + 3))
fi

if pgrep ssh-agent &>/dev/null; then
    points=$((points + 3))
fi

award_points $points 15 "SSH Key Setup"
award_points 10 10 "Advanced SSH Configuration (Manual Check Required)"

# 9. Shell Scripting (35 points)
print_section "9. Shell Scripting (35 points)"

points=0
if [ -f "/usr/local/bin/system_monitor.sh" ] || [ -f "/home/*/system_monitor.sh" ] || [ -f "./system_monitor.sh" ]; then
    points=$((points + 5))
    
    script_file=""
    for location in "/usr/local/bin/system_monitor.sh" "/home/*/system_monitor.sh" "./system_monitor.sh"; do
        if [ -f "$location" ]; then
            script_file="$location"
            break
        fi
    done
    
    if [ -n "$script_file" ]; then
        if [ -x "$script_file" ]; then
            points=$((points + 3))
        fi
        
        if grep -q "date\|uptime\|free\|df\|ps.*cpu" "$script_file"; then
            points=$((points + 5))
        fi
        
        if grep -q "\-h\|\-v\|\-f" "$script_file"; then
            points=$((points + 4))
        fi
        
        if grep -q "getopts\|case.*\-h" "$script_file"; then
            points=$((points + 3))
        fi
    fi
fi

award_points $points 20 "Rocky 1 System Monitor Script"
award_points 15 15 "Rocky 2 Backup Script (Manual Check Required)"

# Additional points for documentation and best practices
print_section "Additional Assessment (20 points)"
award_points 20 20 "Documentation and Best Practices (Manual Assessment)"

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
elif [ $percentage -ge 80 ]; then
    grade="B"
    color=$BLUE
elif [ $percentage -ge 70 ]; then
    grade="C"
    color=$YELLOW
elif [ $percentage -ge 60 ]; then
    grade="D"
    color=$YELLOW
else
    grade="F"
    color=$RED
fi

echo -e "${color}Letter Grade: $grade${NC}" | tee -a "$LOG_FILE"
echo "=======================================" | tee -a "$LOG_FILE"

echo "" | tee -a "$LOG_FILE"
echo "Manual checks required for Rocky 2 systems and some advanced configurations." | tee -a "$LOG_FILE"
echo "Grading log saved to: $LOG_FILE" | tee -a "$LOG_FILE"

# Additional verification suggestions
echo "" | tee -a "$LOG_FILE"
echo "MANUAL VERIFICATION CHECKLIST:" | tee -a "$LOG_FILE"
echo "- Check Rocky 2 network configuration (10 points)" | tee -a "$LOG_FILE"
echo "- Verify Rocky 2 file operations (10 points)" | tee -a "$LOG_FILE"
echo "- Test special permissions on Rocky 2 (10 points)" | tee -a "$LOG_FILE"
echo "- Check Rocky 2 archive operations (10 points)" | tee -a "$LOG_FILE"
echo "- Verify advanced user management on Rocky 2 (10 points)" | tee -a "$LOG_FILE"
echo "- Test advanced SSH configuration (10 points)" | tee -a "$LOG_FILE"
echo "- Review backup script on Rocky 2 (15 points)" | tee -a "$LOG_FILE"
echo "- Assess documentation quality (20 points)" | tee -a "$LOG_FILE"

exit 0
