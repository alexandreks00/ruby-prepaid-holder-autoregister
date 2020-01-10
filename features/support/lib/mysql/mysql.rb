require "mysql2"

class MYSQL
  def initialize
    # Initialize connection variables.
    @HOST = String("cateno-prepago.c3ssunrkn9wn.us-east-1.rds.amazonaws.com")
    @USER_MYSQL = String("developer")
    @PASS_MYSQL = String("developer")
    @PORT_MYSQL = String("3306")

    # Initialize connection object.
    @client = Mysql2::Client.new(
      :host => @HOST,
      :username => @USER_MYSQL,
      :password => @PASS_MYSQL,
      :database => @DATABASE_NAME,
      :port => @PORT_MYSQL,
      :connect_timeout => 30,
    )
  end

  def query_inativa_modalidade(nome, descricao)
    @query = @client.query("SELECT * FROM cateno_backoffice_modalidade.modalidade
								WHERE nome = '#{nome}'
								AND descricao = '#{descricao}'")

    @query.each do |row|
      @id_modalidade = row["id_modalidade"]
    end

    @query = @client.query ("UPDATE cateno_backoffice_modalidade.segmento 
								SET ativo = '0' 
								WHERE id_modalidade_fk = '#{@id_modalidade}'")

    @query = @client.query ("UPDATE cateno_backoffice_modalidade.operacao 
								SET ativo = '0' 
								WHERE id_modalidade_fk = '#{@id_modalidade}'")

    @query = @client.query ("UPDATE cateno_processadora_conductor.modelo_cartao 
								SET ativo = '0' 
								WHERE id_configuracao_cartao_fk in (
									SELECT id_configuracao_cartao 
									FROM cateno_backoffice_modalidade.configuracao_cartao 
									WHERE id_modalidade_fk = '#{@id_modalidade}')")

    @query = @client.query ("UPDATE cateno_backoffice_modalidade.configuracao_cartao 
								SET ativo = '0' 
								WHERE id_modalidade_fk = '#{@id_modalidade}'")

    @query = @client.query ("UPDATE cateno_backoffice_modalidade.modalidade 
								SET ativo = '0' 
								WHERE id_modalidade = '#{@id_modalidade}'")

    @query = @client.query ("UPDATE cateno_processadora_conductor.produto_modalidade 
								SET ativo = '0' 
								WHERE id_modalidade_fk = '#{@id_modalidade}'")
  end

  def query_ativa_modalidade(id_modalidade)
    @query = @client.query ("UPDATE cateno_backoffice_modalidade.segmento 
								SET ativo = '1' 
								WHERE id_modalidade_fk = '#{id_modalidade}'")

    @query = @client.query ("UPDATE cateno_backoffice_modalidade.operacao 
								SET ativo = '1' 
								WHERE id_modalidade_fk = '#{id_modalidade}'")

    @query = @client.query ("UPDATE cateno_processadora_conductor.modelo_cartao 
								SET ativo = '1' 
								WHERE id_configuracao_cartao_fk in (
									SELECT id_configuracao_cartao 
									FROM cateno_backoffice_modalidade.configuracao_cartao 
									WHERE id_modalidade_fk = '#{id_modalidade}')")

    @query = @client.query ("UPDATE cateno_backoffice_modalidade.configuracao_cartao 
								SET ativo = '1' 
								WHERE id_modalidade_fk = '#{id_modalidade}'")

    @query = @client.query ("UPDATE cateno_backoffice_modalidade.modalidade 
								SET ativo = '1' 
								WHERE id_modalidade = '#{id_modalidade}'")

    @query = @client.query ("UPDATE cateno_processadora_conductor.produto_modalidade 
								SET ativo = '1' 
								WHERE id_modalidade_fk = '#{id_modalidade}'")
  end

  def query_consulta_segmento(id_modalidade)
    @query = @client.query ("SELECT * FROM cateno_backoffice_modalidade.segmento 
						WHERE id_modalidade_fk = '#{id_modalidade}'")

    @query.each do |row|
    end
  end

  def query_consulta_operacao(id_modalidade)
    @query = @client.query ("SELECT * FROM cateno_backoffice_modalidade.operacao 
						WHERE id_modalidade_fk = '#{id_modalidade}'")

    @query.each do |row|
    end
  end

  def query_consulta_modelo_cartao(id_modalidade)
    @query = @client.query ("SELECT * FROM cateno_processadora_conductor.modelo_cartao 
						WHERE id_configuracao_cartao_fk in (
							SELECT id_configuracao_cartao FROM cateno_backoffice_modalidade.configuracao_cartao 
							WHERE id_modalidade_fk = '#{id_modalidade}')")

    @query.each do |row|
    end
  end

  def query_consulta_configuracao_cartao(id_modalidade)
    @query = @client.query ("SELECT * FROM cateno_backoffice_modalidade.configuracao_cartao 
						WHERE id_modalidade_fk = '#{id_modalidade}'")

    @query.each do |row|
    end
  end

  def query_consulta_modalidade(id_modalidade)
    @query = @client.query ("SELECT * FROM cateno_backoffice_modalidade.modalidade 
						WHERE id_modalidade = '#{id_modalidade}'")

    @query.each do |row|
    end
  end

  def query_consulta_produto_modalidade(id_modalidade)
    @query = @client.query ("SELECT * FROM cateno_processadora_conductor.produto_modalidade 
						WHERE id_modalidade_fk = '#{id_modalidade}'")

    @query.each do |row|
    end
  end

  def query_consulta_modalidade(id_modalidade)
    @query = @client.query("SELECT * FROM cateno_backoffice_modalidade.modalidade
						WHERE id_modalidade = #{id_modalidade}")

    @query.each do |row|
    end
  end
end
