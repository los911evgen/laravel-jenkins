# Laravel 8 Simple CMS dockerized with Jenkins Pipeline
Взято из  https://github.com/ozdemirburak/laravel-8-simple-cms.git и доработано для организации процесса непрерывной интеграции и доставки средствами Docker и Jenkins

-----
## Оглавление

* [Этапы пайплайна](#item1)
* [Развёртка](#item2)
* [Использование](#item3)

-----
<a name="item1"></a>
## Этапы пайплайна:
  * Checkout SCM
  * Сборка
  * Публикация образа в registry
  * Deployment

-----
<a name="item2"></a>
## Развёртка:

Клонировать репозиторий.

    $ git clone https://github.com/los911evgen/laravel-jenkins.git .

Редактируем env файл, прописываем удобные вам параметры 

    $ nano docker.env

Для развёртки должны быть установлено:
    
    docker 
    Jenkins

Для запуска пайплайна требуется развернуть Jenkins с Jenkins Pipeline и Docker Pipeline плагинами.
Создаем Item -> Pipeline -> Добавляем путь к нашему репозитарию -> Выбираем основную ветку и Script Path выбираем наш Jenkinsfile.
Также в Global credentials нужно создать реквизиты для входа в dockerhub registry с именем dockerhub

-----

В процессе сборки создаётся образ, ТЭК которого соответствует номеру сборки в Jenkins Pipeline. При деплое приложение разворачивается непосредственно с образа последней сборки. После успешной сборки приложение будет доступно по пути <a target="_blank" href="http://localhost:8000/">http://localhost:8000/</a>.

Более подробно о самом приложении тут <a target="_blank" href="https://github.com/ozdemirburak/laravel-8-simple-cms.git">Laravel Simple CMS</a>


