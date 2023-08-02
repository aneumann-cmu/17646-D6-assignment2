#!/bin/bash
set -x
# Replace "YOUR_JENKINS_URL" with the URL of your Jenkins server.
JENKINS_URL="http://127.0.0.1:8080"

# Replace "YOUR_JENKINS_USERNAME" and "YOUR_JENKINS_API_TOKEN" with your Jenkins username and API token.
JENKINS_USERNAME="admin"
JENKINS_PASSWORD="password"

# Function to install Jenkins plugins
install_plugins() {
    sleep 30
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin ant:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin antisamy-markup-formatter:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin authorize-project:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin blueocean:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin build-timeout:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin cloudbees-folder:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin configuration-as-code:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin credentials-binding:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin email-ext:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin git:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin github-branch-source:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin gradle:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin job-dsl:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin ldap:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin matrix-auth:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin mailer:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin maven-plugin:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin pam-auth:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin pipeline-github-lib:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin pipeline-stage-view:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin sonar:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin ssh-slaves:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin startup-trigger-plugin:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin timestamper:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin workflow-aggregator:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin workflow-job:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin workflow-cps:latest -deploy
    java -jar jenkins-cli.jar -s $JENKINS_URL -auth $JENKINS_USERNAME:$JENKINS_PASSWORD install-plugin ws-cleanup:latest -deploy

}

# Download Jenkins CLI if not already present
if [ ! -f "jenkins-cli.jar" ]; then
    wget "$JENKINS_URL/jnlpJars/jenkins-cli.jar"
fi

# Run the plugin installation function
install_plugins
systemctl restart jenkins.service

echo "Jenkins plugin installation completed."
