# Executando o Projeto
* Primeiro verifique se a porta 3000 está liberada na sua máquina, caso não esteja, libere-a ou troque a porta no docker-compose.yml.
* Para iniciar o projeto, basta executar `docker-compose -d up`
* Na primeira vez que executar o projeto, também execute `docker-compose exec web rails db:seed` para gerar a conta de administrador.

# Executar Testes
* Utilize o comando `docker-compose run web rspec`

# Para mais detalhes verificar a [Wiki](https://github.com/lcrmj/rent-ly/wiki) do projeto
