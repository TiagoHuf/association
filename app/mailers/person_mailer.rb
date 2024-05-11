class PersonMailer < ApplicationMailer
    default from: 'no-reply@association.com'

    def balance_report(user)
        @people = Person.order(:nome)

        mail to: user.email, subject: 'Relatório de Saldos'
    end
end