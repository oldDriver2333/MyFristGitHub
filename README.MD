template
	模板工程
	
template没有做访问权限控制，不能对外开放。

域名：
	http://template.efun.com
	
测试域名：
http://templatetest.efun.com

测试打包：
	mvn clean package
正式打包：
	mvn clean package -P pro
	

action
	以.do、.shtml(旧的接口)结尾，还有template.jsp也是生成模板的接口，有可能会用到，暂时先保留。
	
模板测试地址
	http://template.efun.com/testPage.do