# Clean Architecture Flutter com MobX - CRUD de Tarefas

Este é um exemplo de aplicativo Flutter que implementa um CRUD simples de tarefas, seguindo o conceito de Clean Architecture e utilizando o gerenciador de estado MobX.

## Implementação do exemplo

No exemplo fornecido, seguimos a estrutura de diretórios sugerida pela Clean Architecture, conforme listado a seguir:


* lib/app/core: Contém as entidades, os casos de uso e os repositórios abstratos que representam o núcleo da aplicação.

* lib/app/data: Contém a implementação concreta dos repositórios e as classes de acesso a dados, que se relacionam com a camada de dados.

* lib/app/presentation: Contém a interface do usuário e os controllers MobX para gerenciar o estado.

* lib/app/app.dart: Arquivo que inicializa a aplicação.

* lib/app/main.dart: Arquivo que configura o aplicativo Flutter e define a página inicial.

## A seguir, descrevemos as principais partes do exemplo:

TaskEntity: Representa uma tarefa com os atributos id, title e description.

TaskRepository: É a interface abstrata do repositório que define os métodos para obter, adicionar e remover tarefas. Essa interface é implementada em TaskRepositoryImpl.

TaskRepositoryImpl: É a implementação concreta do repositório de tarefas, que armazena as tarefas em uma lista em memória.

TaskController: É o controller MobX que gerencia o estado da página de tarefas. Ele faz uso do TaskRepositoryImpl para buscar, adicionar e remover tarefas.

TaskPage: É a página de exibição das tarefas. Ela exibe uma lista de tarefas em cards, permite adicionar novas tarefas e remover tarefas existentes.
