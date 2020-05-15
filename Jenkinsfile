#!groovy

import org.apache.commons.lang.SystemUtils

pipeline
{
   agent any
   stages
   {
      /* Check out the code from GitHub.  Just use the standard properties */
      stage('checkout') {
         steps {
            echo 'checking out repos'
            deleteDir()
            dir('helloworld')
            {
               checkout scm
            }            
         }
      }
      stage('build code')
      {
      steps {
         dir('helloworld')
         {
            script {
               if(isUnix())
               {
                  //We have a unix/linux/mac machine
                  sh "build.sh"
               }
               else
               {
                  //We have a windows machine
                  bat "build.bat"
               }
            }
         }
      }
      }

      stage('post-build-tasks')
      {
         steps {
            /* add shell scripting here */
            /* Current plugin */
            recordIssues filters: [includeFile('helloworld/*.cpp'), includeFile('helloworld/*.h')], tools: [[$class: 'Cmake']] //not tested - should do both warnings and TODOs? q
         }
      }
   }
}
