using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IDS348_FinalProject.Models
{
    public class Follower
    {
        public int FollowId { get; set; }

        public int FollowerId { get; set; }

        public int FollowingId { get; set; }

        public DateTime FollowDate { get; set; }
    }
}