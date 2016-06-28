/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.jeremydyer.nifi;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.apache.nifi.util.MockFlowFile;
import org.apache.nifi.util.TestRunner;
import org.apache.nifi.util.TestRunners;
import org.junit.Before;
import org.junit.Test;

public class TestZoomImageProcessor {

    private TestRunner testRunner;

    @Before
    public void init() {
        testRunner = TestRunners.newTestRunner(ZoomImageProcessor.class);
    }

    @Test
    public void testZoomImage() {

        try {
            testRunner.enqueue(new File("src/test/resources/GrayScaleImage.jpg").toPath());
            testRunner.run();

            List<MockFlowFile> ffs = testRunner.getFlowFilesForRelationship(ZoomImageProcessor.REL_SUCCESS);
            byte[] data = ffs.get(0).toByteArray();
            FileOutputStream fos = new FileOutputStream(new File("src/test/resources/zoomed.png"));
            fos.write(data);
            fos.close();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}