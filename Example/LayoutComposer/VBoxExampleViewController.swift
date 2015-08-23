//
//  VBoxExampleViewController.swift
//  LayoutComposer
//
//  Created by Yusuke Kawakami on 2015/08/22.
//  Copyright (c) 2015年 CocoaPods. All rights reserved.
//

import UIKit
import LayoutComposer

enum VBoxExampleType: Int {
    case Basic = 1
    case Margin = 2
    case Flex = 3
    case AlignStart = 4
    case AlignEnd = 5
    case AlignCenter = 6
    case AlignStretch = 7
    case AlignEachComponent = 8
    case PackStart = 9
    case PackEnd = 10
    case PackCenter = 11
    case PackFit = 12
}

class VBoxExampleViewController: ExampleViewController {
    let exampleType: VBoxExampleType

    init(exampleType: VBoxExampleType, headerTitle: String) {
        self.exampleType = exampleType
        super.init(headerTitle: headerTitle)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func loadView() {
        super.loadView()
        switch exampleType {
        case .Basic:
            layoutExampleBasic()
        case .Margin:
            layoutExampleMargin()
        case .Flex:
            layoutExampleFlex()
        case .AlignStart:
            layoutExampleAlignStart()
        case .AlignEnd:
            layoutExampleAlignEnd()
        case .AlignCenter:
            layoutExampleAlignCenter()
        case .AlignStretch:
            layoutExampleAlignStretch()
        case .AlignEachComponent:
            layoutExampleAlignEachComponent()
        case .PackStart:
            layoutExamplePackStart()
        case .PackEnd:
            layoutExamplePackEnd()
        case .PackCenter:
            layoutExamplePackCenter()
        case .PackFit:
            layoutExamplePackFit()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func layoutExampleBasic() {
        let view1 = makeItemView(title: "view1 height: 50", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2 height: 100", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3 height: 75", color: UIColor.blueColor())

        contentView.applyLayout(VBox(), items: [
            $(view1, height: 50),
            $(view2, height: 100),
            $(view3, height: 75)
        ])
    }

    private func layoutExampleMargin() {
        let view1 = makeItemView(title: "view1 marginTop: 10", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2 marginTop: 10, marginLeft: 20, marginRight: 30", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3 margins: (10, 30, 0, 20)", color: UIColor.blueColor())

        contentView.applyLayout(VBox(), items: [
            $(view1, height: 50, marginTop: 10),
            $(view2, height: 100, marginTop: 10, marginLeft: 20, marginRight: 30),
            $(view3, height: 75, margins: (10, 30, 0, 20))
        ])
    }

    private func layoutExampleFlex() {
        let view1 = makeItemView(title: "view1 height: 50", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2 flex: 1", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3 flex: 3", color: UIColor.blueColor())
        let view4 = makeItemView(title: "view3 flex: 2", color: UIColor.yellowColor())

        contentView.applyLayout(VBox(), items: [
            $(view1, height: 50),
            $(view2, flex: 1),
            $(view3, flex: 3),
            $(view4, flex: 2)
        ])
    }

    private func layoutExampleAlignStart() {
        let view1 = makeItemView(title: "view1", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3", color: UIColor.blueColor())

        contentView.applyLayout(VBox(align: .Start), items: [
            $(view1, width: 50, height: 50),
            $(view2, width: 100, height: 50),
            $(view3, width: 200, height: 100)
        ])
    }

    private func layoutExampleAlignEnd() {
        let view1 = makeItemView(title: "view1", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3", color: UIColor.blueColor())

        contentView.applyLayout(VBox(align: .End), items: [
            $(view1, width: 50, height: 50),
            $(view2, width: 100, height: 50),
            $(view3, width: 200, height: 100)
        ])
    }

    private func layoutExampleAlignCenter() {
        let view1 = makeItemView(title: "view1", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3", color: UIColor.blueColor())

        contentView.applyLayout(VBox(align: .Center), items: [
            $(view1, width: 50, height: 50),
            $(view2, width: 100, height: 50),
            $(view3, width: 200, height: 100)
        ])
    }

    private func layoutExampleAlignStretch() {
        let view1 = makeItemView(title: "view1", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3 (if width is set align centered)", color: UIColor.blueColor())

        contentView.applyLayout(VBox(align: .Stretch), items: [
            $(view1, height: 50),
            $(view2, height: 50),
            $(view3, width: 250, height: 100)
            ])
    }

    private func layoutExampleAlignEachComponent() {
        let view1 = makeItemView(title: "view1 align: .Start", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2 align: .Center", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3 align: .End", color: UIColor.blueColor())
        let view4 = makeItemView(title: "view4 (Default if width is set)", color: UIColor.yellowColor())
        let view5 = makeItemView(title: "view5 (Default if width is not set)", color: UIColor.magentaColor())

        contentView.applyLayout(VBox(), items: [
            $(view1, width: 200, flex: 1, align: .Start),
            $(view2, width: 200, flex: 1, align: .Center),
            $(view3, width: 200, flex: 1, align: .End),
            $(view4, width: 200, flex: 1),
            $(view5, flex: 1),
        ])
    }

    private func layoutExamplePackStart() {
        let container = UIView()
        container.backgroundColor = UIColor.whiteColor()

        let view1 = makeItemView(title: "view1", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3", color: UIColor.blueColor())

        contentView.applyLayout(VBox(), item:
            $(container, height: 400, layout: VBox(pack: .Start), items: [
                $(view1, height: 50),
                $(view2, height: 50),
                $(view3, height: 100)
            ])
        )
    }

    private func layoutExamplePackCenter() {
        let container = UIView()
        container.backgroundColor = UIColor.whiteColor()

        let view1 = makeItemView(title: "view1", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3", color: UIColor.blueColor())

        contentView.applyLayout(VBox(), item:
            $(container, height: 400, layout: VBox(pack: .Center), items: [
                $(view1, height: 50),
                $(view2, height: 50),
                $(view3, height: 100)
            ])
        )
    }

    private func layoutExamplePackEnd() {
        let container = UIView()
        container.backgroundColor = UIColor.whiteColor()

        let view1 = makeItemView(title: "view1", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3", color: UIColor.blueColor())

        contentView.applyLayout(VBox(), item:
            $(container, height: 400, layout: VBox(pack: .End), items: [
                $(view1, height: 50),
                $(view2, height: 50),
                $(view3, height: 100)
            ])
        )
    }

    private func layoutExamplePackFit() {
        let container = UIView()
        container.backgroundColor = UIColor.whiteColor()

        let view1 = makeItemView(title: "view1", color: UIColor.redColor())
        let view2 = makeItemView(title: "view2", color: UIColor.greenColor())
        let view3 = makeItemView(title: "view3", color: UIColor.blueColor())

        contentView.applyLayout(VBox(), item:
            $(container, layout: VBox(pack: .Fit), items: [ // container height is adjusted to fit items.
                $(view1, height: 50),
                $(view2, height: 50),
                $(view3, height: 100)
            ])
        )
    }
}
