import SwiftUI

struct GlassEffectContainerView: View {
    @Binding var isExpanded: Bool
    @Namespace var animation
    var body: some View {
        Image("pic")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipShape(.rect(cornerRadius: 20))
            .overlay(alignment: .bottom) {
                GlassEffectContainer(spacing: 20) {
                    VStack(spacing: 20) {
                        Spacer()
                        
                        if isExpanded {
                            Group {
                                Image(systemName: "suit.heart.fill")
                                    .font(.title)
                                    .foregroundStyle(.red.gradient)
                                    .frame(width: 50, height: 50)
                                
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundStyle(.white.gradient)
                                    .frame(width: 50, height: 50)
                            }
                            .glassEffect(.regular, in: .capsule)
                            /// To eliminate morphing effect you can use glass effect transition identity
                            /// .glassEffectTransition(.identity)
                            /// if you want to group two views to create a single glass effect without writing a separate H/Vstack, you can utilize this modifier (glassUnion()
                            .glassEffectUnion(id: "Group", namespace: animation)
                        }
                        
                        Button {
                            withAnimation(.smooth(duration: 1, extraBounce: 0)) {
                                isExpanded.toggle()
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                                .font(.title)
                                .foregroundStyle(.white.gradient)
                                .frame(width: 40, height: 40)
                        }
                        .buttonStyle(.glass)
                    }
                }
                .padding(15)
            }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
