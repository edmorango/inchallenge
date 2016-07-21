//
//  Share.swift
//  inchallenge
//
//  Created by José Eduardo Vieira Morango on 7/20/16.
//  Copyright © 2016 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
class Compartilhar: UIView{

    
    @IBInspectable var linhaRetangulo : CGFloat = 1
    @IBInspectable var linhaSeta : CGFloat = 1
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        // Retângulo pai
        let shapeCont = CAShapeLayer()
        
        shapeCont.lineWidth = linhaRetangulo
        shapeCont.fillColor = UIColor.whiteColor().CGColor
        shapeCont.strokeColor = UIColor.blackColor().CGColor
        
        let pathCont = getCompartilhar(self.frame, scale: 0.7)
        
        shapeCont.path = pathCont.CGPath
        
        // Container da seta
        let shapeSetaCont = CAShapeLayer()
        
        shapeSetaCont.fillColor = UIColor.whiteColor().CGColor
        shapeSetaCont.lineWidth = linhaRetangulo
        shapeSetaCont.strokeColor = UIColor.whiteColor().CGColor
        
        let pathSetaCont = getSetaContainer(self.frame, scale: 0.7)
        
        shapeSetaCont.path = pathSetaCont.CGPath
      
        // Seta
        let shapeSeta = CAShapeLayer()


        shapeSeta.lineWidth = linhaSeta
        shapeSeta.fillColor = UIColor.blackColor().CGColor
        shapeSeta.strokeColor = UIColor.blackColor().CGColor

        let pathSeta = getSeta(self.frame, scale: 0.7)

        shapeSeta.path = pathSeta.CGPath
        

        
        // Atribui a seta ao container e o container ao pai.
        shapeSetaCont.addSublayer(shapeSeta)
        shapeCont.addSublayer(shapeSetaCont)
        layer.addSublayer(shapeCont)
        
        
        
    }
    
    
    
    
    
    
    func getCompartilhar(originalRect: CGRect, scale: Double) -> UIBezierPath {
        
        // Escala a largura do rect
        let scaledWidth = (originalRect.size.width * CGFloat(scale) )
        
        //  Obtém a diferença da largura original para a escalada e divide por 2
        let scaledXValue = ((originalRect.size.width) - scaledWidth) / 2
        
        // Escala a altura do rect e a reduz em 30%
        let scaledHeight = (originalRect.size.height * CGFloat(scale) *  0.7)
        
        //  Obtém a diferença da altura original para a escalada e divide por 2
        let scaledYValue = ((originalRect.size.height) - scaledHeight) / 2
        
        
        // Cria um novo rect
        let scaledRect = CGRect(x: scaledXValue, y: scaledYValue, width: scaledWidth, height: scaledHeight)
      
        
        let path = UIBezierPath(roundedRect: scaledRect, cornerRadius: scaledRect.size.width * 0.05)
        
        
        path.closePath()
        return path
    }

    func getSetaContainer(originalRect: CGRect, scale: Double) -> UIBezierPath{
    
        // Escala a largura do rect e corta seu tamanho escalado pela metade.
        let scaledWidth = (originalRect.size.width * CGFloat(scale) * 0.5)
        
        //  Obtém a diferença da largura original para a escalada e divide por 2
        let scaledXValue = ((originalRect.size.width) - scaledWidth) / 2
        
        // Escala a altura do rect
        let scaledHeight = (originalRect.size.height * CGFloat(scale)  )
        
        //  Obtém a diferença da altura original para a escalada e divide por 2
        let scaledYValue = ((originalRect.size.height) - scaledHeight * 1.5)
        
        
        // Cria um novo rect
        let scaledRect = CGRect(x: scaledXValue, y: scaledYValue, width: scaledWidth, height: scaledHeight)
        
        
        
        let path = UIBezierPath(rect: scaledRect)
        
        
        
        path.closePath()
        return path

        
    
    }

    
    func getSeta(rect: CGRect, scale: Double) -> UIBezierPath{
    
    
        let path = UIBezierPath()
        
        // O caminho para o centro do componente
        path.moveToPoint(CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5))
        
        // Adiciona uma linha até o "pescoço" da seta
        path.addLineToPoint(CGPointMake(rect.size.width * 0.5, rect.size.height * 0.10))
        
        // Move o caminho para o "pescoço"
        path.moveToPoint(CGPointMake(rect.size.width * 0.5, rect.size.height * 0.10))

        // Adiciona  x na direita da "cabeça" da seta
        path.addLineToPoint(CGPointMake(rect.size.width * 0.55, rect.size.height * 0.10))
        
        // Adiciona  y na "cabeça" da seta
        path.addLineToPoint(CGPointMake(rect.size.width * 0.5, rect.size.height * 0.03))
    
        // Adiciona  x esquerdo da "cabeça" da seta
        path.addLineToPoint(CGPointMake(rect.size.width * 0.45, rect.size.height * 0.10))
        path.closePath()
        return path
    
    
    }




}