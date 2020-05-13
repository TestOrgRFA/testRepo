#!groovy
pipeline
{
   node
   {
      stage('checkout') {
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
         bat("C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319\\msbuild.exe Helloworld_test\\helloworld_test.vcxproj /t:build /p:Configuration:Debug;Platform:x86")
      }
   }
}
