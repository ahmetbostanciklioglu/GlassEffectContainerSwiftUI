import SwiftUI

struct ContentView: View {
    @State private var isExpanded: Bool = false
    var body: some View {
        ZStack {
            GlassEffectContainerView(isExpanded: $isExpanded)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
