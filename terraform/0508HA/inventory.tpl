[all]
{% for instance in instances %}
{{ instance.tags.Name }} ansible_host={{ instance.public_ip }} ansible_user=ubuntu
{% endfor %}