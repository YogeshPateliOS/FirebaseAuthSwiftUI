import SwiftUI

struct EmailSentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image(systemName: "envelope.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.teal)
            
            VStack(spacing: 8) {
                Text("Check your email")
                    .font(.largeTitle.bold())
                
                Text("We have sent a password recover instructions to your email.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
            
            Button {
                router.navigateToRoot()
            } label: {
                Text("Skip, I'll confirm later")
            }
            .buttonStyle(CapsuleButtonStyle())

            Spacer()
            
            Button {
                router.navigateBack()
            } label: {
                (Text("Did not receive the email? Check your spam filter, or ")
                    .foregroundColor(.gray)
                +
                 Text("try another email address")
                    .foregroundColor(.teal))
            }
        }
        .padding()
        .toolbarRole(.editor)
    }
}

#Preview {
    EmailSentView()
}
