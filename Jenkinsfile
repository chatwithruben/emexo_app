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
                 }
       }   
       stage('code analysis'){
           steps {
           
            sh "mvn sonar:sonar \
                            -Dsonar.projectKey=emexo_app \
                             -Dsonar.host.url=http://ip172-18-0-64-bojk6qb8akr000cglka0-9000.direct.labs.play-with-docker.com \
                               -Dsonar.login=18d4f23086b95819e22ab897f6fe87c491c500bf" \
                                 -PotherOutputDir
                       }  
             }
      stage('docker build'){
         steps{
            sh "sudo docker build -t pipelineimage ."
      }
         
      }
   }

