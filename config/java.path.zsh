# Set JAVA_HOME
if [ -d /usr/libexec/java_home ]; then
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi
