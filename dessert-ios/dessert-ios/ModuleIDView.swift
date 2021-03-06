//ModuleIDView.swift created on 09/09/2020.

import SwiftUI
import MarkdownView

class UIModuleController: UIViewController {
    
    var module: SearchQuery.Data.Search.Result
    
    convenience init() {
        self.init(module: nil)
    }

    init(module: SearchQuery.Data.Search.Result?) {
        self.module = module!
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Maxi error")
    }
    
    func showMarkdown(url: String) {
        let mdView = MarkdownView()
        view.addSubview(mdView)
        mdView.translatesAutoresizingMaskIntoConstraints = false
        mdView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mdView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let urlRaw = Helper.githubToRaw(link: url)
        let readMeLink = Helper.githubReadMe(link: urlRaw!)
        var markdown = try! String(contentsOf: URL(string: readMeLink)!, encoding: String.Encoding.utf8)
        markdown = Helper.stepUpToHTTPS(markdown: markdown)
        markdown = Helper.removeGIFs(markdown: markdown)
        mdView.load(markdown: markdown, enableImage: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showMarkdown(url: module.githubLink!)
    }

}

struct UIModuleView: UIViewControllerRepresentable {
    var module: SearchQuery.Data.Search.Result
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<UIModuleView>) -> UIModuleController {
        let moduleController = UIModuleController(module: module)
        return moduleController
    }

    func updateUIViewController(_ uiViewController: UIModuleController, context: UIViewControllerRepresentableContext<UIModuleView>) {
    }
}

struct ModuleHeaderView: View {
    var module: SearchQuery.Data.Search.Result
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(module.name).font(.largeTitle)
            if module.isCore {
                Text(String("core")).foregroundColor(Color(UIColor(named: "ModulesColor")!))
            } else {
                Text(String("connector")).foregroundColor(Color(UIColor(named: "DessertColor")!))
            }
            Text(String(format: "@%@", module.author.nickname))
            Text(Helper.parseDate(dateToParse: module.publishedDateTime)).font(.caption)
            TagsView(tags: module.tags)
        }.padding()
    }
}

struct ModuleNoMarkdownView: View {
    var module: SearchQuery.Data.Search.Result
    
    var body: some View {
        VStack {
            Text(module.name)
        }
    }
}

struct ModuleIDView: View {
    var module: SearchQuery.Data.Search.Result
    
    var body: some View {
        
        VStack {
            if module.githubLink != nil && module.githubLink?.count != 0 {
                ModuleHeaderView(module: module)
                Divider()
                UIModuleView(module: module)
            } else {
                ModuleHeaderView(module: module)
                Divider()
                VStack(alignment: .leading) {
                    Text(module.description)
                }.padding()
                Divider()
                VStack(alignment: .center) {
                    Text("No github link was Found :(")
                    Text("Add a Readme for this module!")
                }.padding()
                Spacer()
            }
        }.navigationBarTitle(Text("Module"), displayMode: .inline)
    }
}
