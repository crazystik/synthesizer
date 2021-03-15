//
//  OscilatorViewController.swift
//  Synthesizer
//
//  Created by crazystik on 14.03.2021.
//

import UIKit

class OscilatorViewController: UIViewController {
    
    // MARK: - Properties
    private lazy var parameterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Frequency: 0 Hz  Amplitude: 0%"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var waveformSelectorSegmentedControl: UISegmentedControl = {
        var labels = [
            "Sine",
            "Triangle",
            "Sawtooth",
            "Square",
            "Noise"
        ]
        let segmentedControl = UISegmentedControl(items: labels)
        segmentedControl.setContentPositionAdjustment(.zero, forSegmentType: .any, barMetrics: .default)
        segmentedControl.addTarget(self, action: #selector(updateOscillatorWaveform), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = UIColor.secondarySystemBackground
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let configurator: OscilatorConfiguratorProtocol = OscilatorConfigurator()
    var presenter: OscilatorPresenterProtocol!
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configurator(viewController: self)
        presenter.configureView()
    }
    
    // MARK: - Selector Functions
    @objc private func updateOscillatorWaveform() {
        presenter.updateOscillatorWaveform(selected: waveformSelectorSegmentedControl.selectedSegmentIndex)
    }
    
    // MARK: - Implement Touches Functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let coordinate = touch.location(in: view)
        presenter.setSynthesizerParametersFrom(
            touches: .begin(
                coordinate: (
                    x: Float(coordinate.x),
                    y: Float(coordinate.y)
                ),
                viewSize: (
                    width: Float(view.bounds.width),
                    height: Float(view.bounds.height)
                )
            )
        )
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let coordinate = touch.location(in: view)
        presenter.setSynthesizerParametersFrom(
            touches: .moved(
                coordinate: (
                    x: Float(coordinate.x),
                    y: Float(coordinate.y)
                ),
                viewSize: (
                    width: Float(view.bounds.width),
                    height: Float(view.bounds.height)
                )
            )
        )
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        presenter.setSynthesizerParametersFrom(touches: .ended)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        presenter.setSynthesizerParametersFrom(touches: .cancelled)
    }
}

extension OscilatorViewController: OscilatorViewProtocol {
    func style() {
        view.backgroundColor = UIColor.systemBackground
        view.isMultipleTouchEnabled = false
        view.addSubview(waveformSelectorSegmentedControl)
        waveformSelectorSegmentedControl
            .leftAnchor
            .constraint(
                equalTo: view.safeAreaLayoutGuide.leftAnchor
            ).isActive = true
        waveformSelectorSegmentedControl
            .bottomAnchor
            .constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ).isActive = true
        waveformSelectorSegmentedControl
            .rightAnchor
            .constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor
            ).isActive = true
        
        view.addSubview(parameterLabel)
        parameterLabel
            .topAnchor
            .constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ).isActive = true
        parameterLabel
            .leftAnchor
            .constraint(
                equalTo: view.safeAreaLayoutGuide.leftAnchor
            ).isActive = true
        parameterLabel
            .rightAnchor
            .constraint(
                lessThanOrEqualTo: view.safeAreaLayoutGuide.rightAnchor
            ).isActive = true
    }
    
    func setParameterLabel(text: String) {
        parameterLabel.text = text
    }
}
