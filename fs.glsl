// This is Fragment Shader

#version 330 core
in vec3 FragPos;
in vec3 Normal;
out vec4 FragColor;

uniform vec3 lightPos;
uniform vec3 lightColor;
uniform vec3 objectColor;

void main()
{
	vec3 ambientLight = vec3 (0.2, 0.2, 0.2);
	vec3 ambient = ambientLight * lightColor;

	vec3 normalVector = Normal;
	vec3 lightDir = normalize(lightPos - FragPos);
	float diffuseLight = max(dot(normalVector, lightDir), 0.0);
	vec3 diffuse = diffuseLight * lightColor;

	vec3 result = (ambient + diffuse) * objectColor;

	FragColor = vec4 (result, 1.0);
}
