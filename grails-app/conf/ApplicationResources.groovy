modules = {
    application {
        resource url:'js/application.js'
    }

    'flatly' {
        dependsOn: 'bootstrap'
        resource url:'bootswatch/bootstrap.flatly.css'
    }
}