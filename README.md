![CI Status](https://github.com/Vermelho-Rosas-DS/What-Should-I-Pick/actions/workflows/CI.yml/badge.svg)

# O que é o projeto

O _What Should I Pick_ é um projeto de cunho acadêmico realizado na disciplina _Desenvolvimento de Software_ da Universidade de Brasília. O objetivo da aplicação é auxiliar jogadores do vídeo-game [_League Of Legends_](https://www.leagueoflegends.com/pt-br/) a escolherem o seu _campeão_ (personagem dentro do jogo) de forma ótima. Isto é, levando em consideração os papeis que o jogador deseja exercer nas partidas do jogo e as estatísticas compiladas sobre cada _campeão_, a saber: taxa de vitória, taxa de escolha, etc..

# Como rodar este projeto

## Instalação
Instale o ruby 3.1.2
```bash
rbenv install 3.1.2 && rbenv global 3.1.2
```

Clone o repositório em sua máquina
```bash
git clone https://github.com/Vermelho-Rosas-DS/What-Should-I-Pick.git
```

Entre dentro do repositório
```bash
cd What-Should-I-Pick
```

Rode bundler
```bash
bundle install
```

Instale o Postgres
```bash
sudo apt install postgresql-11 libpq-dev
```
```bash
sudo -u postgres createuser seu_nome_de_usuario -s
```
> Obs.: coloque o nome que você preferir no lugar de _seu_nome_de_usuario_

Crie o banco de dados da aplicação
```bash
bin/rails db:create
```
## Execução

Suba a aplicação
```bash
bin/rails server
```

A aplicação estará disponível no endereço `localhost:3000`

# Colaboradores do Projeto

| Nome | Matrícula | Role | Github |
| :--: | :-------: | :--: | :----: |
| Victor Gonçalves | 18/0055241 | Duque | [@VictorJorgeFGA](https://github.com/VictorJorgeFGA) |

