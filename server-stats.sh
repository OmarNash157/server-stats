echo "hostname: $(hostname)"

echo "cpu usage:"
top -bn1 | grep "cpu" | awk '{print "user: " $2"% | system: "$4"% | idle: "$8"%"}'
echo

echo "memory usage:"
free -h | awk '/Mem:/ {
total=$2; used=$3; free=$4;
printf("total: %s | used: %s | free: %s\n", total, used, free) }'
echo

echo "top 5 processes by memory usage"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

echo "os version"
cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"'
echo

echo "uptime"
uptime -p
echo

echo "load average"
uptime | awk -f'load average:' '{print %2}'
echo

echo "logged in users:"
who | awk '{print $1}' | sort | uniq
echo




