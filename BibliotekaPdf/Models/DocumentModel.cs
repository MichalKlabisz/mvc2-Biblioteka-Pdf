using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;


namespace BibliotekaPdf.Models
{
    [MetadataType(typeof(DocumentValidation))]
    public partial class Document// : EntityObject
    {

    }

    public class DocumentValidation
    {

        [DisplayName("Ścieżka do pliku")]
        public String FilePath { get; set; }

        public int Id { get; set; }

        [Required]
        [DisplayName("Tytuł")]
        [StringLength(50)]
        public string Title { get; set; }

        [Required]
        [DisplayName("Autorzy")]
        [StringLength(100)]
        public string Authors { get; set; }

        [DisplayName("Opis")]
        [StringLength(255)]
        public string Description { get; set; }

        [Required(ErrorMessage = "Musisz podać ocenę od 0 do 10 (bez ułamków)")]
        [DisplayName("Ocena od 0 do 10")]
        [Range(0, 10, ErrorMessage="Niepoprawna wartość, możesz wpisać jedynie liczbę całkowitą od 0 do 10")] 
        public int Rating { get; set; }

        
    }

}