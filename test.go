// ehy
package main

import (
	"fmt"
)

const baseVertexShader = `
    #version 410 core 
    precision highp float;

    layout (location = 0) in vec2 aPosition;

    out highp vec2 vUv;
    out highp vec2 vL;
    out highp vec2 vR;
    out highp vec2 vT;
    out highp vec2 vB;

    uniform highp vec2 texelSize;    
    //out highp vec2 texelSize;

    void main () {
        vUv = aPosition * 0.5 + 0.5;
        vL = vUv - vec2(texelSize.x, 0.0);
        vR = vUv + vec2(texelSize.x, 0.0);
        vT = vUv + vec2(0.0, texelSize.y);
        vB = vUv - vec2(0.0, texelSize.y);
        gl_Position = vec4(aPosition, 0.0, 1.0);
    }
`

const fragShader = `
    #version 410 core
    precision highp float;

    layout (location = 0) in vec2 aPosition;

    out highp vec2 vUv;
    out highp vec2 vL;
    out highp vec2 vR;
    out highp vec2 vT;
    out highp vec2 vB;

    uniform highp vec2 texelSize;    
    //out highp vec2 texelSize;

    void main () {
        vUv = aPosition * 0.5 + 0.5;
        vL = vUv - vec2(texelSize.x, 0.0);
        vR = vUv + vec2(texelSize.x, 0.0);
        vT = vUv + vec2(0.0, texelSize.y);
        vB = vUv - vec2(0.0, texelSize.y);
        gl_Position = vec4(aPosition, 0.0, 1.0);
    }
`

func main() {

	INSERT := x
	fmt.Println(x, INSERT)
}
