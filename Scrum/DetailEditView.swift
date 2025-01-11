import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum

    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            return Double(scrum.lengthInMinutes)
        }, set: {
            scrum.lengthInMinutes = Int($0)
        })
    }

    var body: some View {
        Form {
            Section(header: Text("Meeting Info")) {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: intProxy, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
