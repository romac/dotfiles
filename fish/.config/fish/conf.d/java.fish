# >>> JVM installed by coursier >>>
set -gx JAVA_HOME "/Users/romac/Library/Caches/Coursier/arc/https/github.com/graalvm/graalvm-ce-builds/releases/download/jdk-23.0.1/graalvm-community-jdk-23.0.1_macos-aarch64_bin.tar.gz/graalvm-community-openjdk-23.0.1+11.1/Contents/Home"
# <<< JVM installed by coursier <<<

fish_add_path -a "$HOME/Library/Application Support/Coursier/bin"
fish_add_path -a "$JAVA_HOME/bin"
