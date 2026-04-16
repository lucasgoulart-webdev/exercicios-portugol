programa {

  cadeia nome[5]                                                            // Estruturas de dados utilizadas para guardar alunos, matérias, notas e médias
  inteiro idade[5]
  inteiro matricula[5]
  inteiro notaDigitada
  cadeia serie[5]
  cadeia opcao
  cadeia materia[5] = {"Matemática","Portugues","Ciências","História","Educação Física"}
  real notas[5][3]
  real soma=0, media[5][5]
  logico passou = verdadeiro
  

    funcao vazio cadastro_aluno() { // Função que será utilizada para cadastrar todos os 5 alunos, utilizando a variável função isso se torna muito mais pratico
      para(inteiro i=0; i < 5; i++){                                                // Utiliza um laço de repetição para percorrer os vetores e armazenar:
        escreva("\n------------CADASTRO ",i+1," ------------- ")                    // nome, idade, matrícula e série de cada aluno.  
        escreva("\nNOME DO ALUNO: ",nome[i])                                        // Exibe qual cadastro está sendo feito (1 até 5).
        leia(nome[i])                                                               // Lê e armazena o nome do aluno na posição i do vetor.
      enquanto (nome[i] == ""){
      escreva ("Nome de aluno inválido, repita o nome: ")                           // Validação: impede que o usuário deixe o nome vazio.
        leia (nome[i])                                                        
      }
        escreva("\nIDADE DO ALUNO: ",idade[i])                                      // Lê e armazena a idade.
          leia(idade[i])
        escreva("\nMATRÍCULA DO ALUNO: ",matricula[i])                              // Lê e armazena a matrícula.
          leia(matricula[i])
        escreva("\nSERIE DO ALUNO: ",serie[i])                                      // Lê e armazena a série do aluno.
          leia(serie[i])
        escreva("\n\n ")                                                            // Espaçamento visual para o próximo cadastro.
      }
    } 
    funcao vazio mostra_alunos(inteiro i) { // Função que será utilizada para exibir os alunos após o cadastro.
                                                                    // Recebe como parâmetro o índice (posição no vetor).    
        escreva("\n------------CADASTRO ",i+1," ------------- ")                // Mostra qual aluno está sendo exibido.                
        escreva("\nNOME DO ALUNO: ",nome[i])                                    // Exibe todas as informações armazenadas nos vetores.
        escreva("\nIDADE DO ALUNO: ",idade[i])
        escreva("\nMATRÍCULA DO ALUNO: ",matricula[i])
        escreva("\nSERIE DO ALUNO: ",serie[i])
        escreva("\n\n ")                                                        // Espaçamento para melhor organização da saída.
    }
    funcao notas_alunos(inteiro pos_aluno) { // Função que será utilizada para exibir as matérias e as notas. Recebe a posição do aluno e percorre as matérias e notas usando vetores.
      para (inteiro m = 0; m <= 4; m++) {                           // Percorre cada matéria do aluno.
        escreva("\nNotas da matéria: ", materia[m])                 // Exibe as 3 notas de cada matéria (matriz de notas).
      para (inteiro n = 0; n <= 2; n++) {
          escreva(" //",n+1,"° nota:",notas[m][n],"  // ")
        }
          escreva("  Média da matéria ",materia[m]," é ", media[pos_aluno][m],".")              // Mostra a média final da matéria para o aluno.
        se(media[pos_aluno][m]<7){
          escreva("--REPROVADO")                                                                // Verifica se o aluno foi aprovado ou reprovado com base na média.
        }
        senao{
          escreva("--APROVADO")
        }
      }
    }

    funcao inicio() { // Esta função fará com que eu consiga colocar as notas nas matérias sem precisar de um "escolha". Ele passa de aluno em aluno até chegar ao final do código. Tambem ele exibe um "boletim" ao final de cada aluno
      cadastro_aluno()                                                                          // Chama a função que realiza o cadastro dos 5 alunos.
        para(inteiro pos_aluno=1;pos_aluno<=5;pos_aluno++){                                     // Percorre todos os alunos cadastrados (1 até 5).                                 
          limpa()                                                                               // Limpa a tela para melhorar a visualização.
            passou = verdadeiro                                                                 // Variável de controle que indica se o aluno passou em todas as matérias.
          escreva("\n\nCadastro das notas do ",pos_aluno,"° Aluno: ",nome[pos_aluno-1],":\n")                 // Exibe o nome do aluno atual.      
        para(inteiro pos_materia=1;pos_materia<=5;pos_materia++){                                             // Percorre todas as matérias do aluno.                        
          soma = 0                                                                                            // Reinicia a soma das notas para calcular a média da matéria.
          escreva("\nMateria de ",materia[pos_materia-1])                                                     // Percorre as 3 notas da matéria. 
        para(inteiro pos_nota=1;pos_nota<=3;pos_nota++){                                                      
          escreva("\nescreva a ",pos_nota,"° nota:")                                                           
            leia(notaDigitada)
        enquanto(notaDigitada < 0 ou notaDigitada > 10){ // Delimitando o limite da nota entre 0 e 10 como solicitado no trabalho.
          escreva("\nNota invalida\n\n")
          escreva("\nescreva a ",pos_nota,"° nota:")
            leia(notaDigitada)
            }
        se(notaDigitada >= 0 e notaDigitada <= 10){                                              // Armazena a nota na matriz e soma para cálculo da média.
              notas[pos_materia-1][pos_nota-1]=notaDigitada
              soma = soma + notas[pos_materia-1][pos_nota-1]
              media[pos_aluno-1][pos_materia-1] = soma / 3
            }
          }  
        se (media[pos_aluno-1][pos_materia-1]<7) {passou=falso}                                   // Calcula a média da matéria (3 notas).   //// Se o aluno reprovar em alguma matéria, já marca como reprovado geral. 
        }
          mostra_alunos(pos_aluno-1)                                                               // Exibe os dados do aluno.
          notas_alunos(pos_aluno-1)                                                                // Exibe todas as notas, médias e situação por matéria.

        se (passou == verdadeiro){                                                                 // Resultado final do aluno com base em todas as matérias.
          escreva ("\nVocê passou de ano!!") 
        }
        senao {
          escreva ("\nVocê reprovou!!")
        }
        escreva("\n----------------------------------------------------\nDigite qualquer tecla para continuar para o próximo aluno: ")                    // Pausa o sistema antes de ir para o próximo aluno.
        leia(opcao)
      }
    }
}