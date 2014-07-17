package rnp


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

/**
 * DosarController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
@Transactional(readOnly = true)
class DosarController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Dosar.list(params), model: [dosarInstanceCount: Dosar.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Dosar.list(params), model: [dosarInstanceCount: Dosar.count()]
    }

    def show(Dosar dosarInstance) {
        respond dosarInstance
    }

    def create() {
        respond new Dosar(params)
    }

    @Transactional
    def save(Dosar dosarInstance) {
        if (dosarInstance == null) {
            notFound()
            return
        }

        if (dosarInstance.hasErrors()) {
            respond dosarInstance.errors, view: 'create'
            return
        }

        dosarInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'dosarInstance.label', default: 'Dosar'), dosarInstance.numar])
                redirect dosarInstance
            }
            '*' { respond dosarInstance, [status: CREATED] }
        }
    }

    def edit(Dosar dosarInstance) {
        respond dosarInstance
    }

    @Transactional
    def update(Dosar dosarInstance) {
        if (dosarInstance == null) {
            notFound()
            return
        }

        if (dosarInstance.hasErrors()) {
            respond dosarInstance.errors, view: 'edit'
            return
        }

        dosarInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Dosar.label', default: 'Dosar'), dosarInstance.numar])
                redirect dosarInstance
            }
            '*' { respond dosarInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Dosar dosarInstance) {

        if (dosarInstance == null) {
            notFound()
            return
        }

        dosarInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Dosar.label', default: 'Dosar'), dosarInstance.numar])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'dosarInstance.label', default: 'Dosar'), params.numar])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
