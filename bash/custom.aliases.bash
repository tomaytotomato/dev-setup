# Maven

alias mci='mvn clean install'
alias mi='mvn install'
alias mc='mvn clean'
alias mcc='mvn clean compile'
alias mcp='mvn clean package'
alias mcpnt='mvn clean package -DskipTests=true'
alias mp='mvn package'
alias mpnt='mvn package =DskipTests=true'
alias mct='mvn clean test'
alias mrprep='mvn release:prepare'
alias mrperf='mvn release:perform'
alias mrrb='mvn release:rollback'
alias mdep='mvn dependency:tree'
alias mpom='mvn help:effective-pom'
alias mcisk='mci -Dmaven.test.skip=true'
alias mcpsk='mcp -Dmaven.test.skip=true'

# Maven service plugin aliases
alias springrun='mvn spring-boot:run'
alias springstop='mvn spring-boot:stop'
alias jettyrun='mvn jetty:run'
alias quarkrun='mvn quarkus:dev'
alias microrun='mvn mn:run'


# Brucey bonuses
alias gohome='cd $HOME'
alias work='cd $WORK'
alias personal='cd $PERSONAL'
