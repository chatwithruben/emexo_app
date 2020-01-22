pipeline {
   agent any

   tools {
      // Install the Maven version configured as "M3" and add it to the path.
        jdk "java8"
        maven "maven"
       
   }

   stages {
       stage('SCM'){
           steps {
            // Get some code from a GitHub repository
            git 'https://github.com/chatwithruben/emexo_app.git'
                 }
              }
       stage('Build') {
         steps {
            // Run Maven on a Unix agent.
            sh "mvn -Dmaven.test.failure.ignore=true clean package"
            sh "pwd"
            sh "ls -ltr"
                 }
       }   
       stage('code analysis'){
           steps {
           def  sonar = "tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'"
            sh "mvn sonar:sonar \
  -Dsonar.projectKey=emexo_app \
  -Dsonar.host.url=http://ip172-18-0-50-bok9d6g33cq000cbtnl0-9000.direct.labs.play-with-docker.com \
  -Dsonar.login=51aca0fef4831ca913c849a728b4cd7362f10067" 
                               
                       }  
             }
      stage('docker build'){
         steps{
            def docker = "tool name: 'docker', type: 'org.jenkinsci.plugins.docker.commons.tools.DockerTool'"
            sh "sudo docker build -t pipelineimage ."
      }
         
      }
   }
}
