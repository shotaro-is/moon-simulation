precision mediump float;

uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform float uTime;

attribute vec3 position;
attribute vec2 uv;

varying vec2 vUv;
varying vec3 vPosition;

void main(){

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    //modelPosition.z += sin(modelPosition.x *uFrequency.x - uTime) *0.1;
    // modelPosition.z += sin(modelPosition.y *uFrequency.y - uTime) *0.1;
    // modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vUv = uv;
    vPosition = position;
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}