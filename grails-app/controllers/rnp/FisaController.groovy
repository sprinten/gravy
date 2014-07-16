package rnp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * FisaController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class FisaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Fisa.list(params), model: [fisaInstanceCount: Fisa.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Fisa.list(params), model: [fisaInstanceCount: Fisa.count()]
    }

    def show(Fisa fisaInstance) {
        respond fisaInstance
    }

    def create() {
        respond new Fisa(params)
    }

    @Transactional
    def save(Fisa fisaInstance) {
        if (fisaInstance == null) {
            notFound()
            return
        }

        if (fisaInstance.hasErrors()) {
            respond fisaInstance.errors, view: 'create'
            return
        }

        fisaInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fisaInstance.label', default: 'Fisa'), fisaInstance.id])
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
            form {
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
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Fisa.label', default: 'Fisa'), fisaInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fisaInstance.label', default: 'Fisa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
