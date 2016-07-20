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

        
        let spacingX = self.frame.width * 0.05
        let minY = self.frame.height * 0.5
        
        
//        for i in 0...number{
  
        let shapeLayer = CAShapeLayer()
            
            shapeLayer.lineWidth = 8
            shapeLayer.strokeColor = UIColor.blackColor().CGColor
            shapeLayer.fillColor = UIColor.whiteColor().CGColor
        //            shapeLayer.path = drawBezier(self.frame.midX   , y: self.frame.midY, radius: 10, pointyness: 3).CGPath
            shapeLayer.path = starPathInRect(CGRect(x: self.frame.midX, y: self.frame.midY, width: self.frame.midX, height: self.frame.midY)).CGPath
        
            
            layer.addSublayer(shapeLayer)
            
        
//        }
        
        
        
        
    }

    func pointFrom(angle: CGFloat, radius: CGFloat, offset: CGPoint) -> CGPoint {
        return CGPointMake(radius * cos(angle) + offset.x, radius * sin(angle) + offset.y)
    }

    func starPathInRect(rect: CGRect) -> UIBezierPath {
        let path = UIBezierPath()
        
        let starExtrusion:CGFloat = 25
        
        let center = CGPointMake(rect.width / 1.0, rect.height / 1.0)
        
        let pointsOnStar = 5
        var angle:CGFloat = -CGFloat(M_PI / 2.0)
        let angleIncrement = CGFloat(M_PI * 2.0 / Double(pointsOnStar))
        let radius = rect.width / 2.0
        
        var firstPoint = true
        
        
        
        for _ in 1...pointsOnStar {
            
            let point = pointFrom(angle, radius: radius, offset: center)
            let nextPoint = pointFrom(angle + angleIncrement, radius: radius, offset: center)
            let midPoint = pointFrom(angle + angleIncrement / 2.0, radius: starExtrusion, offset: center)
            
            if firstPoint {
                firstPoint = false
                path.moveToPoint(point)
            }
            
            path.addLineToPoint(midPoint)
            path.addLineToPoint(nextPoint)
            
            angle += angleIncrement
        }
        
        path.closePath()
        
        
        return path
    }

    
    
    func generatePoints (x: CGFloat, y: CGFloat, radius: CGFloat, adj : CGFloat = 0) -> [CGPoint]{
    
        
        var sides = sidesNumber
        var points = [CGPoint]()
        
        let baseX  = x
        let baseY  = y
        let rad = radius

        
        // define o ângulo baseado na quantidade de lados do polígono
        let angle = DrawUtils.degreeToRadian(360 / CGFloat(sides))
        
        
        // calcula coordenadas de retas baseadas no ângulo
        while points.count <= sides{
       
            let px = baseX - rad * cos(angle * CGFloat(sides) + DrawUtils.degreeToRadian(adj))
            let py = baseY - rad * sin(angle * CGFloat(sides) + DrawUtils.degreeToRadian(adj))
        
            points.append(CGPoint(x: px, y: py))
            
            sides -= 1
            
            
        }
        
        return points
    
    }
    
    
    func generatePath(x: CGFloat, y: CGFloat, radius : CGFloat, pointyness: CGFloat ) -> CGPathRef{
    
        // Calcula o ajuste
        let adj = 360 / sidesNumber / 2
        
        let path = CGPathCreateMutable()
        let points = generatePoints(x, y: y, radius: radius)
       
        let firstPoint = points.first!
        
        let pointsMin = generatePoints(x, y: y, radius: radius * pointyness, adj: CGFloat(adj))
        
        var i = 0
        
        CGPathMoveToPoint(path, nil, firstPoint.x, firstPoint.y)
        
        for p in points{
        
            CGPathAddLineToPoint(path, nil, pointsMin[i].x, pointsMin[i].y)
            CGPathAddLineToPoint(path, nil, p.x, p.y)
            
            i += 1
            
        }
        CGPathCloseSubpath(path)
        
        return path
        
        
    }
    
    func drawBezier(x: CGFloat, y: CGFloat, radius : CGFloat, pointyness: CGFloat ) -> UIBezierPath{
    
    
        let path = generatePath(x, y: y, radius: radius, pointyness: pointyness)
        
        let bezier = UIBezierPath(CGPath: path)
        
        return bezier
        
    
    }
    
    
    

}





