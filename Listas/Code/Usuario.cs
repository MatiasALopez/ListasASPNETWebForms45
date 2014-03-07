using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Listas
{
    public class Usuario : IEquatable<Usuario>
    {
        #region Constructores

        public Usuario()
        {
            Ingresos = new List<DateTime>();
            Operaciones = new List<Operacion>();
        }

        #endregion Constructores

        #region Propiedades

        public int Id { get; set; }
        public string NombreCompleto { get; set; }
        public Uri FotoUrl { get; set; }
        public bool EstaActivo { get; set; }
        public DateTime CreadoFecha { get; set; }

        public List<DateTime> Ingresos { get; set; }
        public List<Operacion> Operaciones { get; set; }

        #endregion Propiedades

        #region Metodos

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }

        public bool Equals(Usuario other)
        {
            if (other == null)
                return false;

            return Id.Equals(other.Id);
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as Usuario);
        }

        public override string ToString()
        {
            return NombreCompleto;
        }

        /// <summary>
        /// Representa lista de usuarios de muestra
        /// </summary>
        private static List<Usuario> _usuarios;
        private static List<Usuario> Usuarios
        {
            get
            {
                if (_usuarios == null)
                    InicializarUsuariosMuestra();

                return _usuarios;
            }
        }

        public static List<Usuario> ObtenerTodos(bool soloActivos = false)
        {
            var usuarios = Usuarios;

            if (soloActivos)
                usuarios = usuarios
                    .Where(u => u.EstaActivo)
                    .ToList();
            
            return usuarios;
        }

        public static Usuario Obtener(int id)
        {
            return Usuarios
                .SingleOrDefault(u => u.Id.Equals(id));
        }

        public static void Eliminar(Usuario usuario)
        {
            if (usuario == null)
                return;

            Usuarios.Remove(usuario);
        }

        public static List<UsuarioEstadisticasDeUso> ObtenerEstadisticasDeUso()
        {
            return Usuarios
                .Select(u => new UsuarioEstadisticasDeUso
                {
                    Id = u.Id,
                    NombreCompleto = u.NombreCompleto,
                    CantidadDeIngresos = u.Ingresos.Count,
                    UltimoIngreso = u.Ingresos.OrderByDescending(i => i).First(),
                    CantidadDeOperaciones = u.Operaciones.Count
                })
                .ToList();
        }

        public static void InicializarUsuariosMuestra()
        {
            var rnd = new Random();

            _usuarios = new List<Usuario>();

            for (int i = 1; i <= 55; i++)
            {
                var usuario = new Usuario
                {
                    Id = i,
                    NombreCompleto = string.Format("Usuario {0}", i),
                    FotoUrl = new Uri("/Content/Images/avatar.gif", UriKind.Relative),
                    EstaActivo = i % 3 == 0,
                    CreadoFecha = new DateTime(2014, (i % 12) + 1, (i % 20) + 1)
                };

                var cantIngresos = rnd.Next(1, 10);
                for (int j = 1; j <= cantIngresos; j++)
                {
                    usuario.Ingresos.Add(new DateTime(2014, 2, (j % 20) + 1));
                }

                var cantOperaciones = rnd.Next(1, 7);
                for (int k = 1; k <= cantOperaciones; k++)
                {
                    usuario.Operaciones.Add(new Operacion 
                    { 
                        Id = k, 
                        Nombre = string.Format("Operacion {0}", k),
                        Url = new Uri(string.Format("#/Operacion/{0}", k), UriKind.Relative)
                    });
                }

                _usuarios.Add(usuario);
            }
        }

        #endregion Metodos
    }

    public class UsuarioEstadisticasDeUso
    {
        public int Id { get; set; }
        public string NombreCompleto { get; set; }
        public int CantidadDeIngresos { get; set; }
        public DateTime UltimoIngreso { get; set; }
        public int CantidadDeOperaciones { get; set; }
    }
}