class API {
  static String REQUEST_IMG(String img) =>
      'https://image.tmdb.org/t/p/w500$img';

  static const REQUEST_COELHO_LIST_BY_ID = 'getById';
  static const REQUEST_COELHO_LIST_BY_CATEGORY = 'getByCategoria';
  static const REQUEST_STATICS = 'getEstatistica';
  static const REQUEST_REPRODUCTIONS = 'getReproducoesById';
  static const LOGIN = 'login';
  static const REGISTER_USER = 'cadastrarUsuario';
  static const REGISTER_COELHO = 'cadastrarCoelho';
  static const REGISTER_REPRODUCTION = 'cadatrarReproducao';
  static const UPDATE_COELHO = 'editarCoelhoByUser';

  static const DELETE_COELHO = 'eliminarCoelho';
}
