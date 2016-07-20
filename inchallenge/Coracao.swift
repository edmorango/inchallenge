//
//  Coracao.swift
//  inchallenge
//
//  Created by José Eduardo Vieira Morango on 7/20/16.
//  Copyright © 2016 José Eduardo Vieira Morango. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class Coracao: UIView{


    
    override func layoutSubviews() {
        
        super.layoutSubviews()
       
        let shape = CAShapeLayer()
        
        shape.lineWidth = 2
        shape.fillColor = UIColor.whiteColor().CGColor
        shape.strokeColor = UIColor.blackColor().CGColor
        
        let path = getHearts(self.frame, scale: 0.7)
        
        
        
        shape.path = path.CGPath
        path.stroke()
        
        layer.addSublayer(shape)
        
        
    }

    
    func getHearts(originalRect: CGRect, scale: Double) -> UIBezierPath {
        
        // Escala a largura do rect
        let scaledWidth = (originalRect.size.width * CGFloat(scale))
        
        //  Obtém a diferença da largura original para a escalada e divide por 2
        let scaledXValue = ((originalRect.size.width) - scaledWidth) / 2
       
        // Escala a altura do rect
        let scaledHeight = (originalRect.size.height * CGFloat(scale))
       
        //  Obtém a diferença da altura original para a escalada e divide por 2
        let scaledYValue = ((originalRect.size.height) - scaledHeight) / 2
        
        // Cria o caminho
        let path = UIBezierPath()
        
        // Cria um novo rect
        let scaledRect = CGRect(x: scaledXValue, y: scaledYValue, width: scaledWidth, height: scaledHeight)
        
        // Move o path para o centro em x e o limite de y(a base do coração)
        path.moveToPoint(CGPointMake(originalRect.midX, scaledRect.maxY))
        
        
        
        // Define um ponto na origem de x próximo a base de y ( sistema de coordenadas está |- ao invés de |_ )
        let eCurvePoint = CGPointMake(scaledRect.origin.x, scaledRect.origin.y + scaledRect.size.height * 0.25)
        // Define x próximo ao centro do rect e y próximo ao fim
        let eControlPointOne = CGPointMake( scaledRect.origin.x + scaledRect.width * 0.5 , scaledRect.origin.y + scaledRect.size.height * 0.75)
        // Define x na origem e y próximo ao centro do rect
        let eControlPointTwo = CGPointMake( scaledRect.origin.x, scaledRect.origin.y + scaledRect.height * 0.5)
        
        path.addCurveToPoint(eCurvePoint,
                             controlPoint1: eControlPointOne ,
                             controlPoint2: eControlPointTwo )

        
        
        // Define o raio como 25% do tamanho do rect
        let radius = scaledRect.size.width * 0.25
        
        
        // Posiciona X e Y a 25% da largura e altura do rect para gerar um semi círculo em que o diamêtro cruze do começo ao meio do rect
        path.addArcWithCenter(CGPointMake( scaledRect.origin.x + radius ,scaledRect.origin.y + scaledRect.size.height * 0.25),
                              radius: radius,
                              startAngle: CGFloat(M_PI),
                              endAngle: 0,
                              clockwise: true)

        
        
        // Posiciona X a 75% para o diamêtro do círculo cobrir o restante e mantém Y em 25%
        path.addArcWithCenter(CGPointMake( scaledRect.origin.x + radius * 3,scaledRect.origin.y + scaledRect.size.height * 0.25),
                              radius: (scaledRect.size.width/4),
                              startAngle: CGFloat(M_PI),
                              endAngle: 0,
                              clockwise: true)
        
        
        
        // Basciamente um scale a -1 em todos pontos da outra curva
        let dCurvePoint = CGPointMake(originalRect.midX , scaledRect.origin.y + scaledRect.size.height)
        let dControlPointOne =  CGPointMake( scaledRect.maxX ,  scaledRect.origin.y + scaledRect.height * 0.5 )
        let dControlPointTwo = CGPointMake(scaledRect.midX, scaledRect.origin.y + scaledRect.size.height * 0.75)
        
        path.addCurveToPoint(dCurvePoint,
                             controlPoint1: dControlPointOne,
                             controlPoint2: dControlPointTwo)
        path.closePath()
        return path
    }

    
    
}
