import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';

class Ajuda extends StatefulWidget {
  @override
  _AjudaState createState() => _AjudaState();
}

class _AjudaState extends State<Ajuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Text("Ajuda",
              style: TextStyle(color: Colors.white, fontSize: 17)),
          backgroundColor: Color.fromARGB(150, 42, 46, 50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
            iconSize: 20,
          ),
        ),
        body: ListView(
          children: ListTile.divideTiles(
              color: Colors.white70,
              context: context,
              tiles: [
                ListTile(
                  leading: Icon(
                    Icons.sms,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Fale Conosco',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: FaleConosco()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.text_snippet,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Termos de uso e política de privacidade',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: Termos()));
                  },
                ),
              ]).toList(),
        ));
  }
}

class FaleConosco extends StatefulWidget {
  @override
  _FaleConoscoState createState() => _FaleConoscoState();
}

class _FaleConoscoState extends State<FaleConosco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("Fale Conosco",
            style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
          iconSize: 20,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            title: Text(
              'Em caso de eventuais bugs, dúvidas e/ou sugestões entre em contato através de um de nossos canais.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 15,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              FlutterIcons.gmail_mco,
              color: Colors.white,
            ),
            title: Text(
              'tonaufam@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              'Gmail',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 15,
              ),
            ),
          ),
          Divider(
            height: 0,
            color: Colors.white.withOpacity(0.5),
            thickness: 1,
          ),
          ListTile(
            leading: Icon(
              FlutterIcons.instagram_ant,
              color: Colors.white,
            ),
            title: Text(
              '@tonaufam',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              'Instagram',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Termos extends StatefulWidget {
  @override
  _TermosState createState() => _TermosState();
}

class _TermosState extends State<Termos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("Termos de uso e política de privacidade",
          style: TextStyle(color: Colors.white, fontSize: 17)),
        backgroundColor: Color.fromARGB(150, 42, 46, 50),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
          iconSize: 20,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(5),
        children: [
          Text(
              "Este aplicativo foi desenvolvido por Julis Figueira de Araújo através do Programa Institucional de Bolsas de Desenvolvimento Tecnológico e Inovação (PIBITI/CNPq/UFAM) e com orientação do Prof. Dr. Horácio Antônio Braga Fernandes de Oliveira.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Sobre o aplicativo e o fim ao que se destina",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Este aplicativo foi desenvolvido com o intuito de prestar auxílio aos alunos do ensino médio que desejam ingressar na UFAM através do Processo Seletivo Contínuo (PSC). Por meio desse aplicativo será possível com que o usuário organize seus estudos e tenha informações sobre o curso que deseja ingressar.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Sobre as informações presentes no aplicativo",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Todas as informações que constam nesse aplicativo referindo-se ao PSC foram retiradas dos sites: https://antigocompec.ufam.edu.br/ , https://compec.ufam.edu.br/ e https://www.idaam.com.br/atlantic/noticia/3074-UFAM-PSC-Banco-de-Provas-e-Gabarito \n O desenvolvedor se ausenta da responsabilidade de eventuais erros, ausência ou trocas de informações que possam ocorrer entre as notas de corte e provas do PSC.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Sobre os dados armazenados",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "O desenvolvedor não possui acesso a nenhum dos dados inseridos neste aplicativo, sendo armazenados estes no dispositivo do usuário.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Avisos gerais",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "O desenvolvedor se ausenta da responsabilidade de eventual dano causado no aparelho do usuário devido a má uso do aplicativo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Política de Privacidade",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Julis Araújo construiu o aplicativo Tô na Ufam como um aplicativo Ad Supported. Este SERVIÇO é prestado por Julis Araújo sem nenhum custo e deve ser utilizado no estado em que se encontra.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Esta página é usada para informar os visitantes sobre minhas políticas de coleta, uso e divulgação de Informações Pessoais, caso alguém decida usar meu Serviço.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Se você optar por usar meu Serviço, você concorda com a coleta e uso de informações em relação a esta política. As Informações Pessoais que recolho são utilizadas para fornecer e melhorar o Serviço. Não vou usar ou compartilhar suas informações com ninguém, exceto conforme descrito nesta Política de Privacidade.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Os termos utilizados nesta Política de Privacidade têm os mesmos significados que em nossos Termos e Condições, que podem ser acessados na Tô na Ufam, a menos que definido de outra forma nesta Política de Privacidade.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Coleta e uso de informações",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Para uma melhor experiência, ao usar nosso Serviço, posso solicitar que você nos forneça certas informações de identificação pessoal. As informações que solicito serão retidas em seu dispositivo e não serão coletadas por mim de forma alguma.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "O aplicativo usa serviços de terceiros que podem coletar informações usadas para identificá-lo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Link para a política de privacidade de provedores de serviços terceirizados usados pelo aplicativo",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "-Serviços do Google Play",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "-AdMob",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "-Google Analytics para Firebase",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "-Firebase Crashlytics",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Dados de registro",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Quero informar que sempre que você utiliza o meu Serviço, em caso de erro no aplicativo, eu coleto dados e informações (por meio de produtos de terceiros) no seu telefone chamado Log Data. Estes dados de registro podem incluir informações como endereço de protocolo de Internet do dispositivo, nome do dispositivo, versão do sistema operacional, configuração do aplicativo ao utilizar meu serviço, hora e data de uso do serviço e outras estatísticas.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Cookies",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Cookies são arquivos com uma pequena quantidade de dados que são comumente usados como identificadores exclusivos anônimos. Eles são enviados para o seu navegador a partir dos sites que você visita e são armazenados na memória interna do seu dispositivo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Este Serviço não usa esses “cookies” explicitamente. No entanto, o aplicativo pode usar código de terceiros e bibliotecas que usam “cookies” para coletar informações e melhorar seus serviços. Você tem a opção de aceitar ou recusar esses cookies e saber quando um cookie está sendo enviado para o seu dispositivo. Se você optar por recusar nossos cookies, pode não ser capaz de usar algumas partes deste Serviço.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Provedores de serviço",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Posso empregar empresas terceirizadas e indivíduos pelos seguintes motivos:",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "• Para facilitar nosso serviço;",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "• Para fornecer o Serviço em nosso nome;",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "• Executar serviços relacionados com o serviço;",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "• Para nos ajudar a analisar como nosso serviço é usado.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Desejo informar aos usuários deste Serviço que esses terceiros têm acesso às suas Informações Pessoais. O motivo é realizar as tarefas atribuídas a eles em nosso nome. No entanto, eles são obrigados a não divulgar ou usar as informações para qualquer outra finalidade.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Segurança",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Valorizo sua confiança em nos fornecer suas informações pessoais, portanto, estamos nos empenhando para usar meios comercialmente aceitáveis de protegê-las. Mas lembre-se que nenhum método de transmissão pela internet, ou método de armazenamento eletrônico é 100% seguro e confiável, e não posso garantir sua segurança absoluta.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Links para outros sites",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Este serviço pode conter links para outros sites. Se você clicar em um link de terceiros, será direcionado a esse site. Observe que esses sites externos não são operados por mim. Portanto, recomendo fortemente que você reveja a Política de Privacidade desses sites. Não tenho controle e não assumo nenhuma responsabilidade pelo conteúdo, políticas de privacidade ou práticas de quaisquer sites ou serviços de terceiros.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Privacidade das crianças",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Esses serviços não se dirigem a ninguém com menos de 13 anos. Não recolho intencionalmente informações de identificação pessoal de crianças com menos de 13 anos. No caso de eu descobrir que uma criança menor de 13 anos me forneceu informações pessoais, eu as apago imediatamente de nossos servidores. Se você é um pai ou responsável e sabe que seu filho nos forneceu informações pessoais, entre em contato comigo para que eu possa tomar as medidas necessárias.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Mudanças nesta Política de Privacidade",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Posso atualizar nossa Política de Privacidade de tempos em tempos. Portanto, é recomendável revisar esta página periodicamente para verificar quaisquer alterações. Irei notificá-lo de quaisquer alterações, postando a nova Política de Privacidade nesta página.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Esta política entra em vigor em 18/06/2021",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          Text("Termos e Condições",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Ao baixar ou usar o aplicativo, estes termos se aplicam automaticamente a você - portanto, certifique-se de lê-los com atenção antes de usar o aplicativo. Você não tem permissão para copiar ou modificar o aplicativo, qualquer parte do aplicativo ou nossas marcas registradas de forma alguma. Você não tem permissão para tentar extrair o código-fonte do aplicativo e também não deve tentar traduzir o aplicativo para outros idiomas ou fazer versões derivadas. O aplicativo em si, e todas as marcas, direitos autorais, direitos de banco de dados e outros direitos de propriedade intelectual relacionados a ele, ainda pertencem a Julis Araújo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Julis Araújo tem o compromisso de garantir que o aplicativo seja o mais útil e eficiente possível. Por esse motivo, nos reservamos o direito de fazer alterações no aplicativo ou cobrar por seus serviços, a qualquer momento e por qualquer motivo. Nunca cobraremos pelo aplicativo ou seus serviços sem deixar bem claro para você exatamente o que você está pagando.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "O aplicativo Tô na Ufam armazena e processa os dados pessoais que você nos forneceu, a fim de prestar o meu Serviço. É sua responsabilidade manter o seu telefone e o acesso a aplicativos seguros. Portanto, recomendamos que você não faça jailbreak ou root em seu telefone, que é o processo de remoção de restrições e limitações de software impostas pelo sistema operacional oficial de seu dispositivo. Isso pode tornar o seu telefone vulnerável a malware / vírus / programas maliciosos, comprometer os recursos de segurança do seu telefone e pode significar que o aplicativo Tô na Ufam não funcionará corretamente ou não funcionará de todo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "O aplicativo usa serviços de terceiros que declaram seus próprios Termos e Condições.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Link para os Termos e Condições de provedores de serviços terceirizados usados pelo aplicativo",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "• Serviços do Google Play",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "• AdMob",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "• Google Analytics para Firebase",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "• Firebase Crashlytics",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Você deve estar ciente de que há certas coisas pelas quais Julis Araújo não se responsabiliza. Certas funções do aplicativo exigirão que o aplicativo tenha uma conexão ativa com a Internet. A conexão pode ser wi-fi, ou fornecida pelo seu provedor de rede móvel, mas Julis Araújo não pode se responsabilizar pelo aplicativo não funcionar em todas as suas funções se você não tiver acesso a wi-fi e nem sua cota de dados restante.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Se você estiver usando o aplicativo fora de uma área com Wi-Fi, lembre-se de que os termos do contrato com seu provedor de rede móvel ainda se aplicam. Como resultado, você pode ser cobrado por sua operadora de celular pelo custo dos dados durante a conexão ao acessar o aplicativo ou outras cobranças de terceiros. Ao usar o aplicativo, você aceita a responsabilidade por quaisquer cobranças, incluindo taxas de roaming de dados, se usar o aplicativo fora de seu território (ou seja, região ou país) sem desligar o roaming de dados. Se você não for o pagador de contas do dispositivo no qual está usando o aplicativo, esteja ciente de que presumimos que você recebeu permissão do pagador de contas para usar o aplicativo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Na mesma linha, Julis Araújo nem sempre pode se responsabilizar pela maneira como você usa o aplicativo, ou seja, você precisa se certificar de que seu dispositivo permaneça carregado - se ficar sem bateria e você não conseguir ligá-lo para aproveitar o Serviço, Julis Araújo não pode assumir responsabilidades.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Com relação à responsabilidade de Julis Araújo pelo uso que você faz do aplicativo, quando estiver usando o aplicativo, é importante ter em mente que embora nos esforcemos para que esteja sempre atualizado e correto, contamos com terceiros para forneça informações para que possamos disponibilizá-las para você. Julis Araújo não se responsabiliza por qualquer perda, direta ou indireta, que você experimente como resultado de confiar totalmente nesta funcionalidade do aplicativo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Em algum momento, podemos desejar atualizar o aplicativo. O aplicativo está atualmente disponível no Android - os requisitos do sistema (e para quaisquer sistemas adicionais para os quais decidirmos estender a disponibilidade do aplicativo) podem mudar e você precisará baixar as atualizações se quiser continuar usando o aplicativo. Julis Araújo não promete que sempre atualizará o aplicativo para que seja relevante para você e / ou funcione com a versão Android que você instalou no seu dispositivo. No entanto, você promete sempre aceitar as atualizações do aplicativo quando oferecidas a você. Também podemos desejar interromper o fornecimento do aplicativo e pode encerrar o uso dele a qualquer momento sem aviso prévio de encerramento. A menos que informemos o contrário, em caso de rescisão, (a) os direitos e licenças concedidos a você nestes termos serão encerrados; (b) você deve parar de usar o aplicativo e (se necessário) excluí-lo do dispositivo.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Mudanças nestes Termos e Condições",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Posso atualizar nossos Termos e Condições de tempos em tempos. Portanto, é recomendável revisar esta página periodicamente para verificar quaisquer alterações. Irei notificá-lo de quaisquer alterações, publicando os novos Termos e Condições nesta página.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
          Text("Estes termos e condições entraram em vigor em 18/06/2021",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text("Contate-Nos",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60)),
          SizedBox(height: 5),
          Text(
              "Se você tiver dúvidas ou sugestões sobre a minha Política de Privacidade e/ou Termos de Condições, não hesite em entrar em contato comigo pelo e-mail tonaufam@gmail.com.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 13, color: Colors.white60)),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
