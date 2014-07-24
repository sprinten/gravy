package rnp


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FisaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    // static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Fisa.list(params), model: [fisaInstanceCount: Fisa.count()]
    }

    def show(Fisa fisaInstance) {
        respond fisaInstance
    }

    def create() {
        respond new Fisa(params)
    }

    def navigate() {
        render(view: params.mode, model: [fisaInstance: new Fisa(params), currentModel: params.next])
    }

    @Transactional
    def save(Fisa fisaInstance) {

        if (fisaInstance == null) {
            notFound()
            return
        }

        println(params.current)

        if (!fisaInstance.validate([params.current])) {
            println(params.current)
            respond fisaInstance.errors, view: 'create', model: [currentModel: params.current]
            return
        }

        fisaInstance.save flush: true, validate: false

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fisa.label', default: 'Fisa'), fisaInstance.id])
                redirect fisaInstance
            }
            '*' { respond fisaInstance, [status: CREATED] }
        }
    }

    def edit(Fisa fisaInstance) {
        respond fisaInstance
    }

    @Transactional
    def update(Fisa fisaInstance) {
        if (fisaInstance == null) {
            notFound()
            return
        }

        if (fisaInstance.hasErrors()) {
            respond fisaInstance.errors, view: 'edit'
            return
        }

        fisaInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Fisa.label', default: 'Fisa'), fisaInstance.id])
                redirect fisaInstance
            }
            '*' { respond fisaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Fisa fisaInstance) {

        if (fisaInstance == null) {
            notFound()
            return
        }

        fisaInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Fisa.label', default: 'Fisa'), fisaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fisa.label', default: 'Fisa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
