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
               withSonarQubeEnv(credentialsId: 'sonar') {
                               sh "mvn sonar:sonar"
                           }    
                               
                       }  
             }    
      stage('docker build'){
         steps{
            sh "sudo docker build -t pipelineimage ."
      }
         
      }
   }
}
