modules = {
    application {
        resource url: 'js/application.js'
    }

    'flatly' {
        dependsOn: 'bootstrap'
        resource url: 'bootswatch/bootstrap.flatly.css'
    }

    'dropdown' {
        dependsOn: 'jquery'
        resource url: [dir: 'dropdown/css', file: 'dependent-dropdown.css']
        resource url: [dir: 'dropdown/css', file: 'dependent-dropdown.min.css']
        resource url: [dir: 'dropdown/js',  file: 'dependent-dropdown.js']
        resource url: [dir: 'dropdown/js',  file: 'dependent-dropdown.min.js']
        resource url: [dir: 'dropdown/img', file: 'loading.gif']
    }
}