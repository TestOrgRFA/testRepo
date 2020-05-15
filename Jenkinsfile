#!groovy
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
            /* replace with the shell scripts RFA uses */
               bat('build.bat')
          }
      }

      stage('post-build-tasks')
      {
         steps {
            /* add shell scripting here */
            /* Choose one of the following plugin sets */
            /* Old plugin */
            step([$class: 'WarningsPublisher', 
                  canComputeNew: false, 
                  canResolveRelativePaths: false, 
                  consoleParsers: [[parserName: 'AcuCobol Compiler']], 
                  defaultEncoding: '', 
                  excludePattern: '', 
                  healthy: '', 
                  includePattern: '', 
                  messagesPattern: '', 
                  unHealthy: ''])
            /* Current plugin */
            scanForIssues(tool: [$class: 'Cmake']) //not tested - should do both warnings and TODOs? q
         }
      }
   }
}
