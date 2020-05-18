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
                  sh "./build.sh"
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
            recordIssues(tools: [[$class: 'Cmake'], taskScanner(highTags: 'FIXME', ignoreCase: true, includePattern: '**/*.c,**/*.h,**/*.cpp', lowTags: 'HACK', normalTags: 'TODO')]) //not tested - should do both warnings and TODOs?
         }
      }

      stage ('Deploy') 
      {
         steps 
         {
            dir('helloworld')
            {
               script 
               {
                  if(isUnix())
                  {
                        //We have a unix/linux/mac machine
                     /* for an x86 build - need to get the files required for an ARM build */
                     ftpPublisher alwaysPublishFromMaster: true,
                                 continueOnError: false,
                                 failOnError: false,
                                 masterNodeName: '',
                                 paramPublish: null,
                                 publishers: [[configName: 'FTPServer', 
                                                transfers: [[asciiMode: false, 
                                                            cleanRemote: true, 
                                                            excludes: '', 
                                                            flatten: false, 
                                                            makeEmptyDirs: false, 
                                                            noDefaultExcludes: false, 
                                                            patternSeparator: '[, ]+', 
                                                            remoteDirectory: '', 
                                                            remoteDirectorySDF: false, 
                                                            removePrefix: 'build/build', 
                                                            sourceFiles: '**/build/build/**']], 
                                                            usePromotionTimestamp: false, 
                                                            useWorkspaceInPromotion: false, 
                                                            verbose: true]]
                  }
                  else
                  {
                     //We have a windows machine
                     ftpPublisher alwaysPublishFromMaster: true,
                                 continueOnError: false,
                                 failOnError: false,
                                 masterNodeName: '',
                                 paramPublish: null,
                                 publishers: [[configName: 'FTPServer', 
                                                transfers: [[asciiMode: false, 
                                                            cleanRemote: true, 
                                                            excludes: '', 
                                                            flatten: false, 
                                                            makeEmptyDirs: false, 
                                                            noDefaultExcludes: false, 
                                                            patternSeparator: '[, ]+', 
                                                            remoteDirectory: '', 
                                                            remoteDirectorySDF: false, 
                                                            removePrefix: 'build/Debug', 
                                                            sourceFiles: '**/build/Debug/*.*']], 
                                                            usePromotionTimestamp: false, 
                                                            useWorkspaceInPromotion: false, 
                                                            verbose: true]]
                  }
               }
            }
         }
      }
   }
}