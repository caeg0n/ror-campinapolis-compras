class StaticPagesController < ApplicationController
  def privacy_policy
    render plain: privacy_policy_text
  end

  private

  def privacy_policy_text
    %(
        Política de Privacidade do Campinápolis Compras

        1. Introdução
        O Campinápolis Compras, inscrito sob o CNPJ 53.001.068/0001-51, com sede à Avenida Nego Carrim 760 - Campinápolis-MT, valoriza a privacidade de seus usuários e está comprometida em protegê-la. 
        Esta política de privacidade descreve como coletamos, usamos, 
        compartilhamos e protegemos suas informações pessoais.

        2. Dados Coletados
        Ao usar nossa aplicação, coletamos os seguintes dados pessoais:

        Nome
        Endereço de entrega
        Localização GPS

        3. Finalidade da Coleta
        Os dados coletados são utilizados para:

        Processar e entregar seus pedidos
        Melhorar a qualidade de nossos serviços
        Enviar comunicações de marketing, sujeitas ao seu consentimento

        4. Compartilhamento de Dados
        Podemos compartilhar suas informações com:

        Parceiros de entrega
        Estes parceiros são proibidos de usar seus dados para qualquer outra finalidade.

        5. Segurança dos Dados
        Implementamos medidas de segurança robustas para proteger suas informações, incluindo criptografia e segurança de acesso a servidores.

        6. Direitos dos Usuários
        Você tem o direito de acessar, corrigir ou excluir suas informações pessoais. Para exercer esses direitos, entre em contato conosco em caegon2005@hotmail.com/66981102799.

        7. Mudanças na Política de Privacidade
        Qualquer alteração em nossa política será comunicada através de nossa aplicação e nosso site.

        8. Contato
        Para dúvidas ou preocupações sobre nossa prática de privacidade, por favor, entre em contato através do caegon2005@hotmail.com/66981102799.


    )
  end
end
