include <unittest.scad>;
include <rotate_p.scad>;
include <cross_sections.scad>;
include <polysections.scad>;

module test_ring_extrude_closed() {
    echo("==== test_ring_extrude_closed ====");

    include <ring_extrude.scad>;
    
    module test_ring_extrude(sections) {
        expected = [
              [[52, 0, -10], [52, 0, 10], [48, 0, 10], [48, 0, -10]]
            , [[51.875, 11.026, -9.736], [49.831, 10.592, 10.154], [45.939, 9.765, 9.736], [47.984, 10.199, -10.154]]
            , [[49.364, 21.978, -9.366], [45.565, 20.287, 10.197], [41.991, 18.695, 9.366], [45.789, 20.387, -10.197]]
            , [[44.49, 32.324, -8.893], [39.49, 28.691, 10.129], [36.412, 26.455, 8.893], [41.412, 30.088, -10.129]]
            , [[37.401, 41.538, -8.322], [31.957, 35.492, 9.949], [29.512, 32.777, 8.322], [34.956, 38.822, -9.949]]
            , [[28.366, 49.131, -7.66], [23.366, 40.471, 9.66], [21.634, 37.471, 7.66], [26.634, 46.131, -9.66]]
            , [[17.767, 54.682, -6.915], [14.134, 43.501, 9.266], [13.134, 40.424, 6.915], [16.767, 51.604, -9.266]]
            , [[6.081, 57.859, -6.093], [4.682, 44.55, 8.77], [4.372, 41.593, 6.093], [5.77, 54.903, -8.77]]
            , [[-6.143, 58.448, -5.205], [-4.59, 43.666, 8.178], [-4.31, 41.004, 5.205], [-5.863, 55.786, -8.178]]
            , [[-18.314, 56.365, -4.26], [-13.314, 40.977, 7.496], [-12.588, 38.741, 4.26], [-17.588, 54.129, -7.496]]
            , [[-29.83, 51.667, -3.268], [-21.17, 36.667, 6.732], [-20.17, 34.935, 3.268], [-28.83, 49.935, -6.732]]
            , [[-40.114, 44.551, -2.24], [-27.888, 30.973, 5.894], [-26.799, 29.764, 2.24], [-39.025, 43.342, -5.894]]
            , [[-48.645, 35.343, -1.188], [-33.257, 24.162, 4.992], [-32.257, 23.436, 1.188], [-47.645, 34.616, -4.992]]
            , [[-54.993, 24.484, -0.123], [-37.121, 16.527, 4.035], [-36.362, 16.189, 0.123], [-54.233, 24.146, -4.035]]
            , [[-58.84, 12.507, 0.944], [-39.384, 8.371, 3.034], [-38.975, 8.284, -0.944], [-58.431, 12.42, -3.034]]
            , [[-60, 0, 2], [-40, 0, 2], [-40, 0, -2], [-60, 0, -2]]
            , [[-58.431, -12.42, 3.034], [-38.975, -8.284, 0.944], [-39.384, -8.371, -3.034], [-58.84, -12.507, -0.944]]
            , [[-54.233, -24.146, 4.035], [-36.362, -16.189, -0.123], [-37.121, -16.527, -4.035], [-54.993, -24.484, 0.123]]
            , [[-47.645, -34.616, 4.992], [-32.257, -23.436, -1.188], [-33.257, -24.162, -4.992], [-48.645, -35.343, 1.188]]
            , [[-39.025, -43.342, 5.894], [-26.799, -29.764, -2.24], [-27.888, -30.973, -5.894], [-40.114, -44.551, 2.24]]
            , [[-28.83, -49.935, 6.732], [-20.17, -34.935, -3.268], [-21.17, -36.667, -6.732], [-29.83, -51.667, 3.268]]
            , [[-17.588, -54.129, 7.496], [-12.588, -38.741, -4.26], [-13.314, -40.977, -7.496], [-18.314, -56.365, 4.26]]
            , [[-5.863, -55.786, 8.178], [-4.31, -41.004, -5.205], [-4.59, -43.666, -8.178], [-6.143, -58.448, 5.205]]
            , [[5.77, -54.903, 8.77], [4.372, -41.593, -6.093], [4.682, -44.55, -8.77], [6.081, -57.859, 6.093]]
            , [[16.767, -51.604, 9.266], [13.134, -40.424, -6.915], [14.134, -43.501, -9.266], [17.767, -54.682, 6.915]]
            , [[26.634, -46.131, 9.66], [21.634, -37.471, -7.66], [23.366, -40.471, -9.66], [28.366, -49.131, 7.66]]
            , [[34.956, -38.822, 9.949], [29.512, -32.777, -8.322], [31.957, -35.492, -9.949], [37.401, -41.538, 8.322]]
            , [[41.412, -30.088, 10.129], [36.412, -26.455, -8.893], [39.49, -28.691, -10.129], [44.49, -32.324, 8.893]]
            , [[45.789, -20.387, 10.197], [41.991, -18.695, -9.366], [45.565, -20.287, -10.197], [49.364, -21.978, 9.366]]
            , [[47.984, -10.199, 10.154], [45.939, -9.765, -9.736], [49.831, -10.592, -10.154], [51.875, -11.026, 9.736]]
            , [[48, 0, 10], [48, 0, -10], [52, 0, -10], [52, 0, 10]]        
        ];
    
        for(i = [0:len(expected) - 1]) {
            assertEqualPoints(expected[i], sections[i], float_digits = 3);
        }
    }

    shape_pts = [
        [2, -10],
        [2, 10],
        [-2, 10],
        [-2, -10]
    ];

    ring_extrude(shape_pts, radius = 50, twist = 180);
}

module test_ring_extrude_not_closed() {
    echo("==== test_ring_extrude_not_closed ====");

    include <ring_extrude.scad>;
    
    module test_ring_extrude(sections) {
        expected = [
              [[52, 0, -10], [52, 0, 10], [48, 0, 10], [48, 0, -10]]
            , [[50.994, 10.839, -10.667], [50.994, 10.839, 10.667], [46.821, 9.952, 10.667], [46.821, 9.952, -10.667]]
            , [[47.748, 21.259, -11.333], [47.748, 21.259, 11.333], [43.607, 19.415, 11.333], [43.607, 19.415, -11.333]]
            , [[42.392, 30.8, -12], [42.392, 30.8, 12], [38.509, 27.979, 12], [38.509, 27.979, -12]]
            , [[35.152, 39.04, -12.667], [35.152, 39.04, 12.667], [31.761, 35.275, 12.667], [31.761, 35.275, -12.667]]
            , [[26.333, 45.611, -13.333], [26.333, 45.611, 13.333], [23.667, 40.992, 13.333], [23.667, 40.992, -13.333]]
            , [[16.316, 50.216, -14], [16.316, 50.216, 14], [14.586, 44.89, 14], [14.586, 44.89, -14]]
            , [[5.533, 52.643, -14.667], [5.533, 52.643, 14.667], [4.92, 46.809, 14.667], [4.92, 46.809, -14.667]]
            , [[-5.547, 52.776, -15.333], [-5.547, 52.776, 15.333], [-4.906, 46.676, 15.333], [-4.906, 46.676, -15.333]]
            , [[-16.44, 50.596, -16], [-16.44, 50.596, 16], [-14.462, 44.509, 16], [-14.462, 44.509, -16]]
            , [[-26.667, 46.188, -16.667], [-26.667, 46.188, 16.667], [-23.333, 40.415, 16.667], [-23.333, 40.415, -16.667]]
            , [[-35.776, 39.733, -17.333], [-35.776, 39.733, 17.333], [-31.137, 34.581, 17.333], [-31.137, 34.581, -17.333]]
            , [[-43.363, 31.505, -18], [-43.363, 31.505, 18], [-37.538, 27.273, 18], [-37.538, 27.273, -18]]
            , [[-49.088, 21.855, -18.667], [-49.088, 21.855, 18.667], [-42.267, 18.818, 18.667], [-42.267, 18.818, -18.667]]
            , [[-52.69, 11.2, -19.333], [-52.69, 11.2, 19.333], [-45.125, 9.592, 19.333], [-45.125, 9.592, -19.333]]
            , [[-54, 0, -20], [-54, 0, 20], [-46, 0, 20], [-46, 0, -20]]        
        ];
    
        for(i = [0:len(expected) - 1]) {
            assertEqualPoints(expected[i], sections[i], float_digits = 3);
        }
    }

    shape_pts = [
        [2, -10],
        [2, 10],
        [-2, 10],
        [-2, -10]
    ];

    ring_extrude(shape_pts, radius = 50, angle = 180, scale = 2);
}


test_ring_extrude_closed();
test_ring_extrude_not_closed();