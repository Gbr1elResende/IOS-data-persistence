# 🎵 Projeto: Lista de Músicas com SwiftUI e CoreData

Este é um projeto de estudo para iOS que demonstra as operações básicas de persistência de dados localmente usando **SwiftUI** e **CoreData**.

O aplicativo permite ao usuário cadastrar músicas (com título e artista) e exibe todas as músicas salvas em uma lista que se atualiza automaticamente.

## 🚀 Funcionalidades

Este projeto implementa os requisitos básicos de um CRUD (Criar e Ler):

* **Entidade CoreData:** Uma entidade `Music` com atributos `title` e `artist` (ambos `String`).
* **Formulário de Entrada:** Uma view de formulário com `TextFields` para inserir os dados da música.
* **Salvar Dados:** Um botão que salva as informações dos `TextFields` como um novo objeto `Music` no CoreData.
* **Listagem Dinâmica:** Uso do `@FetchRequest` para buscar todas as músicas salvas e exibi-las em uma `List` em tempo real.

## 🛠️ Tecnologias Utilizadas

* **Swift:** Linguagem principal utilizada.
* **SwiftUI:** Framework declarativo para a construção da interface do usuário.
* **CoreData:** Framework da Apple para persistência de dados e gerenciamento do banco de dados local.

## 📖 Estrutura do Projeto

* `MinhaMusicaAppApp.swift`: Ponto de entrada do app, onde o contexto do CoreData (`viewContext`) é injetado no ambiente do SwiftUI.
* `ContentView.swift`: A view principal que contém:
    * `@Environment(\.managedObjectContext)` para acessar o contexto.
    * `@FetchRequest` para buscar os dados de `Music`.
    * `@State` para controlar os `TextFields` do formulário.
    * A `List` que renderiza os itens.
    * A função `addMusic()` para salvar os dados.
* `Persistence.swift`: Classe auxiliar (template do Xcode) que configura a "pilha" (stack) do CoreData, incluindo a versão `inMemory` para o Preview.
* `MinhaMusicaApp.xcdatamodeld`: O arquivo visual que define a entidade `Music` e seus atributos.

## 🏃 Como Executar

1.  Clone este repositório.
2.  Abra o arquivo `.xcodeproj` no Xcode.
3.  Selecione um simulador de iPhone ou um dispositivo físico.
4.  Pressione **Build and Run** (Cmd+R).
