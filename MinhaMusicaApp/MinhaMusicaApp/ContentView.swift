import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Music.title, ascending: true)],
        animation: .default)
    private var musicItems: FetchedResults<Music>
    @State private var currentTitle: String = ""
    @State private var currentArtist: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Adicionar Nova Música")) {
                        TextField("Título da Música", text: $currentTitle)
                        TextField("Nome do Artista", text: $currentArtist)
                    }
                }
                .frame(height: 160)
                Button(action: addMusic) {
                    Text("Salvar Música")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .disabled(currentTitle.isEmpty || currentArtist.isEmpty)
                List(musicItems) { music in
                    VStack(alignment: .leading) {
                        Text(music.title ?? "Sem Título")
                            .font(.headline)
                        Text(music.artist ?? "Artista Desconhecido")
                            .font(.subheadline)
                    }
                }
                .navigationTitle("Minha Playlist")
            }
        }
    }

    private func addMusic() {
        withAnimation {
            let newMusic = Music(context: viewContext)
            newMusic.title = currentTitle
            newMusic.artist = currentArtist

            do {
                try viewContext.save()
                currentTitle = ""
                currentArtist = ""
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
