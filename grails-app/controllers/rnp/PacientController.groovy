package rnp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PacientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    static scaffold = true

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pacient.list(params), model:[pacientInstanceCount: Pacient.count()]
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pacient.list(params), model:[pacientInstanceCount: Pacient.count()]
    }

    def show(Pacient pacientInstance) {
        respond pacientInstance
    }

    def create() {
        respond new Pacient(params)
    }

    @Transactional
    def save(Pacient pacientInstance) {
        if (pacientInstance == null) {
            notFound()
            return
        }

        if (pacientInstance.hasErrors()) {
            respond pacientInstance.errors, view:'create'
            return
        }

        pacientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pacient.label', default: 'Pacient'), pacientInstance.id])
                redirect pacientInstance
            }
            '*' { respond pacientInstance, [status: CREATED] }
        }
    }

    def edit(Pacient pacientInstance) {
        respond pacientInstance
    }

    @Transactional
    def update(Pacient pacientInstance) {
        if (pacientInstance == null) {
            notFound()
            return
        }

        if (pacientInstance.hasErrors()) {
            respond pacientInstance.errors, view:'edit'
            return
        }

        pacientInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pacient.label', default: 'Pacient'), pacientInstance.id])
                redirect pacientInstance
            }
            '*'{ respond pacientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pacient pacientInstance) {

        if (pacientInstance == null) {
            notFound()
            return
        }

        pacientInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pacient.label', default: 'Pacient'), pacientInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pacient.label', default: 'Pacient'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
