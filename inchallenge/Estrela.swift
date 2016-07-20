//
//  Estrela.swift
//  inchallenge
//
//  Created by José Eduardo Vieira Morango on 7/20/16.
//  Copyright © 2016 José Eduardo Vieira Morango. All rights reserved.
//


import UIKit



@IBDesignable
class Estrela: UIView{

    @IBInspectable var number : Int = 1
    @IBInspectable var sidesNumber : Int = 5
    
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()

        
        // Define o espaçamento em X entre os layers para 5% da tela
        let spacingX = self.frame.width * 0.04
       
        //Define o espaçamento mínimo entre os shapes
        let baseSpacingX = self.frame.width * 0.01
        
        // Define a coordenada Y onde os layers serão desenhados
        let baseY = self.frame.height * 0.5
        
        // Define altura e largura para 15% do tamanho dos respectivos pra cada layer
        let width = self.frame.width * 0.1
        let height = self.frame.height * 0.1
        
        for i in 1...number{
        
        let shapeLayer = CAShapeLayer()
            
            shapeLayer.lineWidth = 3
            shapeLayer.strokeColor = UIColor.blackColor().CGColor
            shapeLayer.fillColor = UIColor.whiteColor().CGColor
           
            let rect  = CGRect(x: baseSpacingX + spacingX * CGFloat(i-1) + width * CGFloat(i-1) , y: baseY, width: width, height: height)
            
            
            shapeLayer.path = starBezierPath(rect)

        
            layer.addSublayer(shapeLayer)
            
        
        }
    }
    
    
    
    // Obtém as coordenadas pegando o ângulo e o raio
    func pointFrom(angle angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        return CGPointMake(radius * cos(angle) + offset.x, radius * sin(angle) + offset.y)
    }
    
    
    func starBezierPath(rect : CGRect) -> CGPath{
    
        
        let path = UIBezierPath()
        
        
        // Obtém o ponto central do rect
        let center = CGPointMake(rect.midX, rect.midY)

        
        // Define a ângulo do shape, influencia na inclinação
        var angle  = CGFloat(M_PI / 2.0)
        
        
        // Divide o 360 graus em partes iguais
        let angleIncrement = CGFloat(M_PI * 2.0 / Double(sidesNumber))
  
        
        // define como raio 30% da largura do rect, influencia na altura e largura
        let radius = (rect.width * 0.35 + rect.height * 0.35 ) / 2
        
        
        
        // Calcula um dos pontos superiores e posiciona o path lá.
        let point = pointFrom(angle: angle, radius: radius, offset: center)
        path.moveToPoint(point)
        
        
        
        // Define os pontos e liga as linhas
        for _ in 1...sidesNumber{
            
            // Calcula um ponto mediano
            let midPoint = pointFrom(angle: angle+angleIncrement / 2.0, radius: radius * 2, offset: center)
            
            // Alterar o ângulo
            angle += angleIncrement
            
            // Calcula um ponto superior
            let nextPoint = pointFrom(angle: angle, radius: radius, offset: center)
        
            // Desenha as linhas
            path.addLineToPoint(midPoint)
            path.addLineToPoint(nextPoint)
            
            
            
            
            
        }
        
        path.closePath()
        return path.CGPath
    
    }
    
    
    
    

}





