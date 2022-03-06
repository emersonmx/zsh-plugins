# Clean Architecture

![Diagrama](https://blog.cleancoder.com/uncle-bob/images/2012-08-13-the-clean-architecture/CleanArchitecture.jpg)

## Camadas

A camada de **domínio** tem apenas objetos e interfaces de domínio.

Os casos de uso também podem estar na camada de **domínio**, porém como
interfaces. A implementação concreta dos casos de uso ficam na camada de **casos
de uso**.

A camada de **caso de uso** implementa as interfaces do **domínio** e cria
interfaces para adaptadores.

O implementação de conexões com o banco

A camada de **adaptadores de interface** implementa as interfaces da camada de
**caso de uso** e cria interfaces de controle para a camada mais externa.

A camada externa implementa as interfaces da camada de adaptadores.

## Referências

- [Artigo original](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
