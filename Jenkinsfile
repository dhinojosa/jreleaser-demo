pipeline {
  agent any
  tools {
    maven 'maven-3.8.4'
    jdk 'JDK 11'
  }
  stages {
    stage('Build') {
      steps {
        // Define your build step as you'd normally do.
        // example:
        git url: 'http://github.com/dhinojosa/jreleaser-demo.git', branch: 'main'
        sh 'mvn verify'
      }
    }

    stage('Release') {
      tools {
        // JRelease requires Java 11 to run.
        // Configure your own JDK 11+ installation
        // and refer to it here
        jdk '11'
      }

      environment {
        // Setup required environment variables
        JRELEASER_GITHUB_TOKEN = credentials('github-token')
      }

      steps {
        // Get the jreleaser downloader
        sh 'curl -sL https://git.io/get-jreleaser > get_jreleaser.java'
        // Download JReleaser with version = <version>
        // Change <version> to a tagged JReleaser release
        // or leave it out to pull `latest`.
        sh 'java get_jreleaser.java 1.0.1'
        // Let's check we've got the right version
        sh 'java -jar jreleaser-cli.jar --version'
        // Execute a JReleaser command such as 'full-release'
        sh 'java -jar jreleaser-cli.jar full-release'
      }
    }
  }
}
