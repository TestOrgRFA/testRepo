#!groovy
pipeline
{
   stages
   {
      stage('checkout')
      {
         echo 'checking out repos'
         deleteDir()
         dir('helloworld')
         {
            checkout scm
         }
      }
      stage('build code')
      {
         /* groovylint-disable-next-line LineLength */
         bat(tool(name:'MSBuild',type:'plugins.hudson.msbuild.MsBuildInstallation') 'Helloworld_test/helloworld_test.vcxproj /t:build /p:Configuration:Debug;Platform:x86')
      }
   }
}
